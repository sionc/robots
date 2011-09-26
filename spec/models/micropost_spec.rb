# This class was adapted from the example in Ruby on Rails Tutorial by Michael Hartl which
# can be found at http://ruby.railstutorial.org/ruby-on-rails-tutorial-book.

require 'spec_helper'

describe Micropost do

  before(:each) do
    @attr = { :content => "This is a test",
              :robot_id => 1}
  end

  it "should require content" do
    no_content_micropost = Micropost.new(@attr.merge(:content => ""))
    no_content_micropost.should_not be_valid
  end

  it "should require robot id" do
      no_robot_id__micropost = Micropost.new(@attr.merge(:robot_id => nil))
      no_robot_id__micropost.should_not be_valid
  end


  it "should reject content that is too long" do
    long_content = "a" * 141
    long_content_micropost = Micropost.new(@attr.merge(:content => long_content))
    long_content_micropost.should_not be_valid
  end

end
