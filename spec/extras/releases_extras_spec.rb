require 'spec_helper'

class DummyClass
  extend Release::Extras
end

describe Release::Extras do
  let(:demo_metainfo) do
    { "length"=>88716,
      "name"=>"1175547.png",
      "piece length"=>32768,
      "pieces"=>"),z\x97\xB4w\b\x05\t\xB2\xC2O\x81\x8C\xD6D\x14\xAA\x85\x8A\x0E\xCAYC\x97\x88l\xAF\xBD\xB0\xCCp\xCB\xAC_\xDF\xFCL\x04\xE3t\xA5!\xD3-\xBF\e\x9CP_\xFF\xE2\xFAk\x0FN\xCCd\xC2\x1E",
      "private"=>0 }
  end

  context "#get_metainfo" do
    let(:metainfo) { DummyClass.send(:get_metainfo, 'spec/support/files/demo.torrent') }

    it "should return torrent's info section" do
      metainfo.should eq(demo_metainfo)
    end

    it "its bencoded SHA1 hash should be 20 bytes long" do
      Digest::SHA1.digest(BEncodr.bencode(metainfo)).bytesize.should eq(20)
    end
  end

  context "#get_files_list" do
    let(:demo_files_list) { [{ :length=>88716, :path=>["1175547.png"] }] }

    it "should return torrent's files list" do
      DummyClass.send(:get_files_list, demo_metainfo).should == demo_files_list
    end
  end

  context "#get_info_hash" do
    let(:info_hash) { DummyClass.send(:get_info_hash, demo_metainfo) }

    it "should return torrent's SHA1 encoded info_hash" do
      info_hash.should == "%CEn%AF%EB%24Ou%F3%FEl%25%AC%A2n%0C%BA%A6%A5%C3%AE"
    end
  end
end
