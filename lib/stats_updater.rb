require 'curb'
require 'mongo'
require 'bencodr'
require 'logger'

class UpdateStats
  include Mongo

  def initialize(tracker_uri, database, collection)
    @log = Logger.new(STDOUT)
    @log.level = Logger::INFO

    @tracker_uri = tracker_uri
    @database    = database
    @collection  = collection

    connect_to_db(database)
  end

  def connect_to_db(database)
    begin
      @con = Connection.new
    rescue Mongo::ConnectionFailure
      @log.fatal "Couldn't connect to the database"
      @log.info  "Waiting for 600 seconds..."
      sleep 600
      retry
    else
      @db  = @con.db(database)
    end
  end

  def update_stats(time_diff)
    if @con.connected?
      @coll   = @db.collection(@collection) if @con.connected?
      subset  = @coll.find({ "updated_at" => { "$lt" => Time.now - time_diff }})
      if subset.count > 0
        subset.each do |release|
          infohash = release["trhash"]
          begin
            get = Curl::Easy.perform("#{@tracker_uri}/announce?info_hash=#{infohash}")
          rescue Curl::Err::ConnectionFailedError
            @log.fatal "Couldn't connect to tracker"
            @log.info "Waiting for 600 seconds..."
            sleep 600
            retry
          end
          fetched               = get.body_str.bdecode
          release["stats"]      = Array[fetched["incomplete"], fetched["complete"]]
          release["updated_at"] = Time.now
          @coll.save(release)
        end
      end
      @log.info "Everything is ok, waiting 180 sec for next update"
      sleep 180
    else
      connect_to_db(@database)
    end
  end
end

TRACKER_URI = 'http://192.168.1.1:6969'
DATABASE    = 'easybt_development'
COLLECTION  = 'releases'

updater = UpdateStats.new(TRACKER_URI, DATABASE, COLLECTION)
loop { updater.update_stats(480) }