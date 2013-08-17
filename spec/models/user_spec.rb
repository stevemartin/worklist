require 'spec_helper'

describe User do
  it 'has a profile' do
    user = FactoryGirl.create(:user)
    user.build_profile.class.should == User::Profile
  end

end
