require 'spec_helper'

describe "user/profiles/index" do
  before(:each) do
    assign(:user_profiles, [
      stub_model(User::Profile,
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
      ),
      stub_model(User::Profile,
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
      )
    ])
  end

  it "renders a list of user/profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Names".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email Address".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Landline Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
