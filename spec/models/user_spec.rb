require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :name => "Test Tester",
              :email => "test@test.com",
              :password => "testme",
              :password_confirmation => "testme"}
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  it "should require an email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_robot = User.new(@attr.merge(:name => long_name))
    long_name_robot.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

end
