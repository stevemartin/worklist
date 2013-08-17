require 'spec_helper'

describe User::Profile do
  it 'belongs to a user' do
    user = FactoryGirl.create(:user)
    profile = FactoryGirl.create(:profile, :user => user)
    profile.user_id.should == user.id
  end
end
