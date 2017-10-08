require 'rails_helper'

describe PreAuthWorklistsController do
  describe "routing" do
    let(:url) { '1' }
    let(:url_key) { 'my-ur1-k3y' }

    it "routes to #new" do
      expect(get: "/pre_auth/new").to route_to("pre_auth_worklists#new")
    end

it "routes to #show" do
      expect(get: "/pre_auth/#{url}/#{url_key}").to route_to("pre_auth_worklists#show", :url => url, :url_key => url_key)
    end

    it "routes to #show" do
      expect(get: "/pre_auth/#{url}/#{url_key}").to route_to("pre_auth_worklists#show", :url => url, :url_key => url_key)
    end

    it "routes to #edit" do
      expect(get: "/pre_auth/#{url}/#{url_key}/edit").to route_to("pre_auth_worklists#edit", :url => url, :url_key => url_key)
    end

      it "routes to #create" do
        expect(post: "/pre_auth").to route_to("pre_auth_worklists#create")
      end

    it "routes to #update" do
      expect(put: "/pre_auth/#{url}/#{url_key}").to route_to("pre_auth_worklists#update", :url => url, :url_key => url_key)
    end

    it "routes to #destroy" do
      expect(delete: "/pre_auth/#{url}/#{url_key}").to route_to("pre_auth_worklists#destroy", :url => url, :url_key => url_key)
    end

  end
end
