require "spec_helper"

describe PreAuthWorklistsController do
  describe "routing" do
    let(:url) { '1' }
    let(:url_key) { 'my-ur1-k3y' }

    it "routes to #new" do
      get("/pre_auth/new").should route_to("pre_auth_worklists#new")
    end

it "routes to #show" do
      get("/pre_auth/#{url}/#{url_key}").should route_to("pre_auth_worklists#show", :url => url, :url_key => url_key)
    end

    it "routes to #show" do
      get("/pre_auth/#{url}/#{url_key}").should route_to("pre_auth_worklists#show", :url => url, :url_key => url_key)
    end

    it "routes to #edit" do
      get("/pre_auth/#{url}/#{url_key}/edit").should route_to("pre_auth_worklists#edit", :url => url, :url_key => url_key)
    end

      it "routes to #create" do
        post("/pre_auth").should route_to("pre_auth_worklists#create")
      end

    it "routes to #update" do
      put("/pre_auth/#{url}/#{url_key}").should route_to("pre_auth_worklists#update", :url => url, :url_key => url_key)
    end

    it "routes to #destroy" do
      delete("/pre_auth/#{url}/#{url_key}").should route_to("pre_auth_worklists#destroy", :url => url, :url_key => url_key)
    end

  end
end
