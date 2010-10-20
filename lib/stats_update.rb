require 'curb'
require 'mongo'
require 'bencodr'
include Mongo

TRACKER_URI = "http://192.168.1.1:6969"

db      = Connection.new.db('easybt_development')
coll    = db.collection('releases')

loop do
  subset  = coll.find({ "updated_at" => { "$lt" => Time.now - 480 }})
  if subset.count > 0
    subset.each do |release|
      infohash              = release["trhash"]
      get                   = Curl::Easy.perform("#{TRACKER_URI}/announce?info_hash=#{infohash}")
      fetched               = get.body_str.bdecode
      release["stats"]      = Array[fetched["incomplete"], fetched["complete"]]
      release["updated_at"] = Time.now
      coll.save(release)
    end
  end
  sleep 180
end