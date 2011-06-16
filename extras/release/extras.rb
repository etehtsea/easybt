module Release::Extras
  private
  def scrape
    Curl::Easy.perform(APP_CONFIG['scrape_uri'] + info_hash).body_str rescue nil
  end

  def get_metainfo(file_path)
    BEncodr.bdecode_file(file_path)['info']
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
