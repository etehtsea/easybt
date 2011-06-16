require 'spec_helper'

describe Release do
  subject { Fabricate(:release) }

  its(:files) { should == [{ :length=>88716, :path=>["1175547.png"] }] }
  its(:info_hash) { should == "%CEn%AF%EB%24Ou%F3%FEl%25%AC%A2n%0C%BA%A6%A5%C3%AE" }

  context "#stats_outdated?" do
    let(:release) do
      time_travel_to((APP_CONFIG['update_interval'] + 20).minutes.ago) do
        Fabricate(:release)
      end
    end

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
      time_travel_to((APP_CONFIG['update_interval'] + 20).minutes.ago) do
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
