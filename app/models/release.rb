class Release
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :description
  field :info_hash
  field :files, type: Array
  field :stats, type: Hash,
    default: { 'complete' => 0, 'downloaded' => 0, 'incomplete' => 0 }

  mount_uploader :torrent, TorrentUploader

  before_create :set_metainfo

  validates :title, :torrent, :presence => true

  def set_metainfo
    metainfo = get_metainfo
    self.files = get_files_list(metainfo)
    self.info_hash = get_info_hash(metainfo)
  end

  def update_stats
    if stats_outdated?
      self.stats = BEncodr.bdecode(scrape)['files'].values[0] unless scrape.nil?
    end
  end

  private

  def scrape
    Curl::Easy.perform(APP_CONFIG['scrape_uri'] + info_hash).body_str rescue nil
  end

  def stats_outdated?
    self.updated_at < APP_CONFIG['update_interval'].minutes.ago
  end

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
