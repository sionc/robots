require "spec_helper"

describe RobotsController do
  describe "routing" do

    it "routes to #index" do
      get("/robots").should route_to("robots#index")
    end

    it "routes to #new" do
      get("/robots/new").should route_to("robots#new")
    end

    it "routes to #show" do
      get("/robots/1").should route_to("robots#show", :id => "1")
    end

    it "routes to #edit" do
      get("/robots/1/edit").should route_to("robots#edit", :id => "1")
    end

    it "routes to #create" do
      post("/robots").should route_to("robots#create")
    end

    it "routes to #update" do
      put("/robots/1").should route_to("robots#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/robots/1").should route_to("robots#destroy", :id => "1")
    end

  end
end
