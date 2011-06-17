class TorrentUploader < CarrierWave::Uploader::Base
  storage :grid_fs

  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(torrent)
  end
end
