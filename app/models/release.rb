require 'bencodr'
require 'digest/sha1'
require 'cgi'
require 'curb'
require 'carrierwave/orm/mongoid'

class Release
  include Mongoid::Document
  include Mongoid::Slug

  mount_uploader :torrent, TorrentUploader

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
  belongs_to_related :user

  protected

    def get_category
      ReleasesController::CATEGORIES.each_pair do |cat, sub|
        self.category = cat if sub.include?(self.subcategory)
      end
    end

    def get_metainfo
      tfile           = "/home/kes/Projects/easybt/public" + self.torrent.to_s
      decoded_torrent = BEncodr.decode_file(tfile)
      metainfo        = decoded_torrent.fetch("info")

      if metainfo.key?("files")
        files = metainfo.fetch("files")
        files.each {|file| self.files << file }
      else
        hash = Hash.new
        tmp  = Array.new
        hash["length"] = metainfo.fetch("length")
        tmp            << metainfo.fetch("name")
        hash["path"]   = tmp

        self.files << hash
      end

      infohash        = decoded_torrent.fetch("info").bencode
      infohash_sha1   = Digest::SHA1.digest(infohash)
      infohash_esc    = CGI::escape(infohash_sha1)

      self.trhash     = infohash_esc


    end
end

