require 'curb'
require 'mongo'
require 'bencodr'
require 'logger'

class UpdateStats
  include Mongo

  def initialize(tracker_uri, db_name, coll_name)
    @log = Logger.new(STDOUT)
    @log.level = Logger::INFO

    @tracker_uri = tracker_uri
    @db_name     = db_name
    @coll_name   = coll_name

    connect_to_db(db_name)
  end

  def connect_to_db(db_name)
    begin
      @con = Connection.new
    rescue Mongo::ConnectionFailure
      @log.fatal "Couldn't connect to the database"
      @log.info  "Waiting for 600 seconds..."
      sleep 600
      retry
    else
      @db  = @con.db(db_name)
    end
  end

  def update_stats(time_diff)
    if @con.connected?
      coll   = @db.collection(@coll_name)
      subset  = coll.find({ "updated_at" => { "$lt" => Time.now - time_diff }})
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
          release["stats"]      = [fetched["incomplete"], fetched["complete"]]
          release["updated_at"] = Time.now
          coll.save(release)
        end
      end
      @log.info "Everything is ok, waiting 180 sec for next update"
      sleep 180
    else
      connect_to_db(@db_name)
    end
  end
end

TRACKER_URI = 'http://192.168.1.1:6969'
DB_NAME     = 'easybt_development'
COLL_NAME   = 'releases'

updater = UpdateStats.new(TRACKER_URI, DB_NAME, COLL_NAME)
loop { updater.update_stats(480) }