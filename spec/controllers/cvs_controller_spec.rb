require 'spec_helper'

describe CvsController do

  describe 'GET show' do
    let(:profile) { FactoryGirl.create(:profile) }
    it 'should show the cv at the given url' do
      get :show, url: profile.url
      assigns(:cv).should be_a User::Profile
    end
  end

end
