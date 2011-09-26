class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => []

  def home
    @user = current_user
    @robots = Robot.find(:all,:conditions => {:user_id => current_user.id})
    @relationships = Relationship.find(:all, :conditions => {:tracker_id => current_user.id})
  end

end
