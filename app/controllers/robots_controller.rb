class RobotsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  # GET /robots
  # GET /robots.xml
  def index
    @robots = Robot.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @robots }
    end
  end

  # GET /robots/1
  # GET /robots/1.xml
  def show
    session[:current_robot_id] = nil
    @micropost = Micropost.new
    @robot = Robot.find(params[:id])
    session[:current_robot_id] = @robot.id
    @microposts = @robot.microposts.paginate(:page => params[:page])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @robot }
    end
  end

  # GET /robots/new
  # GET /robots/new.xml
  def new
    @robot = Robot.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @robot }
    end
  end

  # GET /robots/1/edit
  def edit
    @robot = Robot.find(params[:id])
  end

  # POST /robots
  # POST /robots.xml
  def create
    @robot = Robot.new(params[:robot])

    respond_to do |format|
      if @robot.save
        @robot.update_attribute(:user_id, current_user.id)
        format.html { redirect_to(@robot, :notice => 'Robot was successfully created.') }
        format.xml  { render :xml => @robot, :status => :created, :location => @robot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @robot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /robots/1
  # PUT /robots/1.xml
  def update
    @robot = Robot.find(params[:id])

    respond_to do |format|
      if @robot.update_attributes(params[:robot])
        format.html { redirect_to(@robot, :notice => 'Robot was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @robot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /robots/1
  # DELETE /robots/1.xml
  def destroy
    @robot = Robot.find(params[:id])
    @robot.destroy

    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
    end
  end
end

