require 'spec_helper'
require 'cancan/matchers'

shared_examples_for "should not be able to" do
  [:create, :update, :destroy].each do |action|
    it "#{action} posts" do
      should_not be_able_to(action, Fabricate.build(:post))
    end
  end

  [Release, Comment].each do |model|
    [:update, :destroy].each do |action|
      it "#{action} foreign #{model}" do
        should_not be_able_to(action, Fabricate.build(:"#{model.to_s.downcase}"))
      end
    end
  end
end

describe "Admin" do
  subject { Ability.new(Fabricate.build(:user, admin: true)) }

  it "should be able to do everything" do
    should be_able_to(:manage, :all)
  end
end

describe "Guest" do
  subject { Ability.new(User.new) }

  it "should be able to read anything" do
    should be_able_to(:read, :all)
  end

  it_behaves_like "should not be able to"
end

describe "User" do
  let(:user) { Fabricate.build(:user) }
  subject { Ability.new(user) }

  context "should be able to" do
    it "should be able to read anything" do
      should be_able_to(:read, :all)
    end

    [Release, Comment].each do |model|
      [:create, :update, :destroy].each do |action|
        it "#{action} own #{model}" do
          should be_able_to(action, Fabricate.build(:"#{model.to_s.downcase}", user: user))
        end
      end
    end
  end

  it_behaves_like "should not be able to"
end
