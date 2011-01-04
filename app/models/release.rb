require 'bencodr'
require 'digest/sha1'
require 'cgi'
require 'carrierwave/orm/mongoid'

class Release
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps

  mount_uploader :torrent, TorrentUploader

  CATEGORIES = {
   'Audio'        => ['Music', 'A-books'],
   'Video'        => ['Movies','Serials'],
   'Applications' => ['Windows', 'Unix', 'Mac'],
   'Games'        => ['Pc', 'Mac', 'Console'],
   'Other'        => ['E-books', 'Pictures', 'Comics']
  }

  field :name
  slug  :name
  field :description
  field :trhash
  field :stats, :type => Array, :default => [0, 0]
  field :files, :type => Array, :default => []
  field :subcategory
  field :category

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :subcategory

  validates_format_of :torrent,
                      :with => %r{\.torrent$}i,
                      :message => 'must be a torrent file.'

  validates_uniqueness_of :trhash,
                          :message => 'This torrent had been uploaded before'

  before_create :get_category, :get_metainfo
  
  referenced_in :user

  class << self
    def by_cat(id)
      where(:category => id.capitalize)
    end

    def by_subcat(id)
      where(:subcategory => id.capitalize)
    end
  end

  protected

    def get_category
      CATEGORIES.each_pair do |cat, sub|
        self.category = cat if sub.include?(self.subcategory)
      end
    end

    def get_metainfo
      tfile    = Rails.root.to_s + "/public/" + self.torrent.to_s
      metainfo = BEncodr.decode_file(tfile).fetch("info")

      if metainfo.key?("files")
        self.files = metainfo.fetch("files")
      else
        hash = Hash.new
        hash["length"] = metainfo.fetch("length")
        hash["path"]   = Array.new << (metainfo.fetch("name"))

        self.files << hash
      end

      infohash        = metainfo.bencode
      infohash_sha1   = Digest::SHA1.digest(infohash)
      infohash_esc    = CGI::escape(infohash_sha1)

      self.trhash     = infohash_esc
    end
end

