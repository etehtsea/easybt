namespace :releases do
  desc "Fetch all releases stats"
  task :fetch => :environment do
    require 'curb'

    TRACKER_URI  = "http://fileshare.su:6969"

    def generate_stats
      Release.all.each do |release|
        infohash      = release.trhash
        get           = Curl::Easy.perform("#{TRACKER_URI}/announce?info_hash=#{infohash}")
        fetched       = get.body_str.bdecode
        release.stats = Array[fetched.fetch("incomplete"), fetched.fetch("complete")]
        release.save
      end
    end

  generate_stats
  end
end

