require 'spec_helper'

describe Release do
  subject { Fabricate(:release) }

  let(:demo_metainfo) do
    { "length"=>88716,
      "name"=>"1175547.png",
      "piece length"=>32768,
      "pieces"=>"),z\x97\xB4w\b\x05\t\xB2\xC2O\x81\x8C\xD6D\x14\xAA\x85\x8A\x0E\xCAYC\x97\x88l\xAF\xBD\xB0\xCCp\xCB\xAC_\xDF\xFCL\x04\xE3t\xA5!\xD3-\xBF\e\x9CP_\xFF\xE2\xFAk\x0FN\xCCd\xC2\x1E",
      "private"=>0 }
  end


  its(:files) { should == [{ :length=>88716, :path=>["1175547.png"] }] }
  its(:info_hash) { should == "%CEn%AF%EB%24Ou%F3%FEl%25%AC%A2n%0C%BA%A6%A5%C3%AE" }

  context "#get_metainfo" do
    let(:metainfo) { subject.send(:get_metainfo) }

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
      subject.send(:get_files_list, demo_metainfo).should == demo_files_list
    end
  end

  context "#get_info_hash" do
    let(:info_hash) { subject.send(:get_info_hash, demo_metainfo) }

    it "should return torrent's SHA1 encoded info_hash" do
      info_hash.should == "%CEn%AF%EB%24Ou%F3%FEl%25%AC%A2n%0C%BA%A6%A5%C3%AE"
    end
  end

  context "#stats_outdated?" do
    let(:release) { time_travel_to(30.minutes.ago) { Fabricate(:release) } }

    it "should false true if release is outdated" do
      release.send(:stats_outdated?).should eq(true)
    end

    it "should return false if release is fresh" do
      release.title = "New title"
      release.save
      release.send(:stats_outdated?).should eq(false)
    end
  end

  context "#update_stats" do
    let(:outdated_release) do
      time_travel_to(30.minutes.ago) do
        Fabricate(:release).tap do |obj|
          obj.stub!(:scrape).and_return("d5:filesd20:\xA8\xD0\xF4\xDE_'\xA2\x8C\x84p\x83\xE7\xCD\xD8];\x88\x91\xE8Zd8:completei1e10:downloadedi0e10:incompletei0eeee")
        end
      end
    end

    let(:fresh_release) { Fabricate(:release) }

    before do
      [outdated_release, fresh_release].each { |release| release.update_stats }
    end

    it "if release outdated" do
      outdated_release.stats.should == { 'complete' => 1, 'downloaded' => 0, 'incomplete' => 0}
    end

    it "should do noting if release is fresh" do
      fresh_release.stats.should == { 'complete' => 0, 'downloaded'=> 0, 'incomplete' => 0 }
    end
  end
end
