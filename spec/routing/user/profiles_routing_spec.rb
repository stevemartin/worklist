require "spec_helper"

describe User::ProfilesController do
  describe "routing" do

    # it "routes to #index" do
    #   get("/user/profiles").should route_to("user/profiles#index")
    # end

    it "routes to #new" do
      get("/users/1/profile/new").should route_to("user/profiles#new", :user_id => "1")
    end

    it "routes to #show" do
      get("/users/1/profile").should route_to("user/profiles#show", :user_id => "1")
    end

    it "routes to #edit" do
      get("/users/1/profile/edit").should route_to("user/profiles#edit", :user_id => "1")
    end

    it "routes to #create" do
      post("/users/1/profile").should route_to("user/profiles#create", :user_id => "1")
    end

    it "routes to #update" do
      put("/users/1/profile").should route_to("user/profiles#update", :user_id => "1")
    end

    it "routes to #destroy" do
      delete("/users/1/profile").should route_to("user/profiles#destroy", :user_id => "1")
    end

  end
end
