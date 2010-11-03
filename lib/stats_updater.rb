require 'curb'
require 'mongo'
require 'bencodr'
require 'logger'

class UpdateStats
  include Mongo

  def initialize(trackeruri)
    @tracker_uri = trackeruri
  end

  @@logger = Logger.new("log/stats_updater.log")
  @@logger.level = Logger::INFO

  def self.log
    class_variable_get(:@@logger)
  end

  def connect_to_db(database, collection)
    begin
      @db      = Connection.new.db(database)
      @coll    = @db.collection(collection)
    rescue Mongo::ConnectionFailure
      @@logger.fatal "Can't connect to the database"
    end
  end

  def update_stats(time_diff)
    subset  = @coll.find({ "updated_at" => { "$lt" => Time.now - time_diff }})
    if subset.count > 0
      subset.each do |release|
        infohash              = release["trhash"]
        begin
          get                   = Curl::Easy.perform("#{@tracker_uri}/announce?info_hash=#{infohash}")
          fetched               = get.body_str.bdecode
          release["stats"]      = Array[fetched["incomplete"], fetched["complete"]]
          release["updated_at"] = Time.now
          @coll.save(release)
        rescue Curl::Err::ConnectionFailedError
          @@logger.error "Can't connect to the tracker"
          raise "Failed to connect to the tracker"
        end
      end
    end
  end
end

updater = UpdateStats.new("http://192.168.1.1:6969")
updater.connect_to_db('easybt_development', 'releases')

loop do
  UpdateStats.log.info "Executing update_stats method"
  begin
    update = Thread.new { updater.update_stats(480) }
    UpdateStats.log.info "Going to sleep (180)..."
    sleep 180
  rescue RuntimeError
    UpdateStats.log.info "Going to sleep (300)..."
    sleep 300
    update.kill if update.alive?
  end
end