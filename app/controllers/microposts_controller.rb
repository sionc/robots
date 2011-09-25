class MicropostsController < ApplicationController

  def create
    @robot =  Robot.find(session[:current_robot_id])
    @micropost  = @robot.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Robot status updated!"
    else
      flash[:success] = "Robot status could could not be updated!"
    end
    redirect_to @robot
  end

  def destroy
    @robot =  Robot.find(session[:current_robot_id])
    @micropost = @robot.microposts.find(params[:id])
    @micropost.destroy
    redirect_to @robot
  end
end
