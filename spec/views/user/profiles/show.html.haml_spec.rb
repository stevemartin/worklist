require 'spec_helper'

describe "user/profiles/show" do
  before(:each) do
    @user_profile = assign(:user_profile, stub_model(User::Profile,
      :first_name => "First Name",
      :middle_names => "Middle Names",
      :last_name => "Last Name",
      :email_address => "Email Address",
      :website => "Website",
      :landline_phone => "Landline Phone",
      :mobile_phone => "Mobile Phone",
      :description => "MyText",
      :education => "MyText",
      :work_history => "MyText",
      :personal => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Middle Names/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email Address/)
    rendered.should match(/Website/)
    rendered.should match(/Landline Phone/)
    rendered.should match(/Mobile Phone/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
