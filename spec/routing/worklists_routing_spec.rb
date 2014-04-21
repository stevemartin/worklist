require "spec_helper"

describe WorklistsController do
  describe "routing" do

    it "routes to #index" do
      get("/worklists").should route_to("worklists#index")
    end

    it "routes to #new" do
      get("/worklists/new").should route_to("worklists#new")
    end

    it "routes to #show" do
      get("/worklists/1").should route_to("worklists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/worklists/1/edit").should route_to("worklists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/worklists").should route_to("worklists#create")
    end

    it "routes to #update" do
      put("/worklists/1").should route_to("worklists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/worklists/1").should route_to("worklists#destroy", :id => "1")
    end

  end
end
