class RelationshipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @robot = Robot.find(params[:relationship][:trackee_id])
    current_user.track!(@robot)
    respond_to do |format|
#      format.html {redirect_to @robot}
      format.js
    end
  end

  def destroy
    @robot = Relationship.find(params[:id]).trackee
    current_user.untrack!(@robot)
    respond_to do |format|
#      format.html {redirect_to @robot}
      format.js
    end
  end

end
