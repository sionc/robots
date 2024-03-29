require 'spec_helper'

include Devise::TestHelpers

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe RobotsController do

  # This should return the minimal set of attributes required to create a valid
  # Robot. As you add validations to Robot, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:name => "robot", :user_id => 1}
  end

  describe "with user logged in," do

    before (:each) do
      @user = Factory.create(:user)
      sign_in @user
    end

    describe "GET index" do
      it "assigns all robots as @robots" do
        robot = Robot.create! valid_attributes
        get :index
        assigns(:robots).should eq([robot])
      end
    end

    describe "GET show" do
      it "assigns the requested robot as @robot" do
        robot = Robot.create! valid_attributes
        get :show, :id => robot.id.to_s
        assigns(:robot).should eq(robot)
      end
    end

    describe "GET new" do
      it "assigns a new robot as @robot" do
        get :new
        assigns(:robot).should be_a_new(Robot)
      end
    end

    describe "GET edit" do
      it "assigns the requested robot as @robot" do
        robot = Robot.create! valid_attributes
        get :edit, :id => robot.id.to_s
        assigns(:robot).should eq(robot)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Robot" do
          expect {
            post :create, :robot => valid_attributes
          }.to change(Robot, :count).by(1)
        end

        it "assigns a newly created robot as @robot" do
          post :create, :robot => valid_attributes
          assigns(:robot).should be_a(Robot)
          assigns(:robot).should be_persisted
        end

        it "redirects to the created robot" do
          post :create, :robot => valid_attributes
          response.should redirect_to(Robot.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved robot as @robot" do
          # Trigger the behavior that occurs when invalid params are submitted
          Robot.any_instance.stub(:save).and_return(false)
          post :create, :robot => {}
          assigns(:robot).should be_a_new(Robot)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Robot.any_instance.stub(:save).and_return(false)
          post :create, :robot => {}
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested robot" do
          robot = Robot.create! valid_attributes
          # Assuming there are no other robots in the database, this
          # specifies that the Robot created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Robot.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => robot.id, :robot => {'these' => 'params'}
        end

        it "assigns the requested robot as @robot" do
          robot = Robot.create! valid_attributes
          put :update, :id => robot.id, :robot => valid_attributes
          assigns(:robot).should eq(robot)
        end

        it "redirects to the robot" do
          robot = Robot.create! valid_attributes
          put :update, :id => robot.id, :robot => valid_attributes
          response.should redirect_to(robot)
        end
      end

      describe "with invalid params" do
        it "assigns the robot as @robot" do
          robot = Robot.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Robot.any_instance.stub(:save).and_return(false)
          put :update, :id => robot.id.to_s, :robot => {}
          assigns(:robot).should eq(robot)
        end

        it "re-renders the 'edit' template" do
          robot = Robot.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Robot.any_instance.stub(:save).and_return(false)
          put :update, :id => robot.id.to_s, :robot => {}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested robot" do
        robot = Robot.create! valid_attributes
        expect {
          delete :destroy, :id => robot.id.to_s
        }.to change(Robot, :count).by(-1)
      end

      it "redirects to the robots list" do
        robot = Robot.create! valid_attributes
        delete :destroy, :id => robot.id.to_s
        response.should redirect_to(root_url)
      end
    end

  end

end
