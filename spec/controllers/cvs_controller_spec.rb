require 'spec_helper'

describe CvsController do

  describe 'GET show' do
    let(:profile) { FactoryGirl.create(:profile) }
    it 'should show the cv at the given url' do
      get :show, url: profile.url
      assigns(:cv).should be_a User::Profile
    end
  end

  describe 'DELETE destroy' do
    let(:profile) { FactoryGirl.create(:profile) }

    it 'should delete the profile' do
      id = profile.id
      delete :destroy, url: profile.url, url_key:profile.url_key, format: :json
      expect{ User::Profile.find( id ) }.to raise_exception(ActiveRecord::RecordNotFound)
    end

    context 'with invalid url key' do
      it 'should not delete the worklist' do
        id = profile.id
        delete :destroy, url: profile.url, url_key:"anIncorrectK3y", format: :json
        expect{ User::Profile.find( id ) }.not_to raise_exception
      end
    end
  end

end
