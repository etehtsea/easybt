class Release
  include Mongoid::Document
  include Mongoid::Slug

  field :title
  field :description
  field :info_hash
  field :files, type: Array

  mount_uploader :torrent, TorrentUploader

  before_create :set_metainfo

  validates :title, :torrent, :presence => true

  def set_metainfo
    metainfo = get_metainfo
    self.files = get_files_list(metainfo)
    self.info_hash = get_info_hash(metainfo)
  end

  private

  def get_metainfo
    BEncodr.bdecode_file(torrent.current_path)['info']
  end

  def get_files_list(metainfo)
    if metainfo.key?('files')
      metainfo['files']
    else
      [{ length: metainfo['length'], path: [metainfo['name']] }]
    end
  end

  def get_info_hash(metainfo)
    CGI::escape(Digest::SHA1.digest(BEncodr.bencode(metainfo)))
  end
end
