require "spec_helper"

describe WorklistsController do
  describe "routing" do

    it "routes to #url" do
      get("/1").should route_to("worklists#url", :url => "1")
    end

    it "routes to #new" do
      get("/worklists/new").should route_to("worklists#new")
    end

    it "routes to #show" do
      get("/worklists").should route_to("worklists#show")
    end

    it "routes to #edit" do
      get("/worklists/edit").should route_to("worklists#edit")
    end

    it "routes to #create" do
      post("/worklists").should route_to("worklists#create")
    end

    it "routes to #update" do
      put("/worklists").should route_to("worklists#update")
    end

    it "routes to #destroy" do
      delete("/worklists").should route_to("worklists#destroy")
    end

  end
end
