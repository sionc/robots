require 'spec_helper'

describe Robot do

  before(:each) do
    @attr = { :name => "Test Robot"}
  end

  it "should create a new instance given valid attributes" do
    Robot.create!(@attr)
  end

  it "should require a name" do
    no_name_robot = Robot.new(@attr.merge(:name => ""))
    no_name_robot.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_robot = Robot.new(@attr.merge(:name => long_name))
    long_name_robot.should_not be_valid
  end

end
