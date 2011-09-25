require 'spec_helper'
include Devise::TestHelpers

describe PagesController do

  before (:each) do
    @user = Factory.create(:user)
    sign_in @user
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

end
