# This class was adapted from the example in Ruby on Rails Tutorial by Michael Hartl which
# can be found at http://ruby.railstutorial.org/ruby-on-rails-tutorial-book.

require 'spec_helper'

describe Relationship do

  before(:each) do
    @tracker = Factory(:user)
    @trackee = Factory(:robot)
    
    @relationship = @tracker.relationships.build(:trackee_id => @trackee.id)
  end

  it "should create a relationship between user and robot" do
    @relationship.save!
  end

  describe "track methods" do
    before(:each) do
      @relationship.save
    end

    it "should have a tracker" do
      @relationship.should respond_to(:tracker)
    end

    it "should have the right tracker" do
      @relationship.tracker.should == @tracker
    end

    it "should have a trackee" do
      @relationship.should respond_to(:trackee)
    end

    it "should have the right tracker" do
      @relationship.trackee.should == @trackee
    end
  end

end
