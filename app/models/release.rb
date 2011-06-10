class Release
  include Mongoid::Document

  field :title
  field :description

  mount_uploader :torrent_file, TorrentUploader

  validates :title, :presence => true
end
