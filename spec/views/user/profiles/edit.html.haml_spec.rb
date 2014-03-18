require 'spec_helper'

describe "user/profiles/edit" do
  before(:each) do
    @user_profile = assign(:user_profile, stub_model(User::Profile,
      :first_name => "MyString",
      :middle_names => "MyString",
      :last_name => "MyString",
      :email_address => "MyString",
      :website => "MyString",
      :landline_phone => "MyString",
      :mobile_phone => "MyString",
      :description => "MyText",
      :education => "MyText",
      :work_history => "MyText",
      :personal => "MyText"
    ))
  end

  xit "renders the edit user_profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_profile_path(@user_profile), "post" do
      assert_select "input#user_profile_first_name[name=?]", "user_profile[first_name]"
      assert_select "input#user_profile_middle_names[name=?]", "user_profile[middle_names]"
      assert_select "input#user_profile_last_name[name=?]", "user_profile[last_name]"
      assert_select "input#user_profile_email_address[name=?]", "user_profile[email_address]"
      assert_select "input#user_profile_website[name=?]", "user_profile[website]"
      assert_select "input#user_profile_landline_phone[name=?]", "user_profile[landline_phone]"
      assert_select "input#user_profile_mobile_phone[name=?]", "user_profile[mobile_phone]"
      assert_select "textarea#user_profile_description[name=?]", "user_profile[description]"
      assert_select "textarea#user_profile_education[name=?]", "user_profile[education]"
      assert_select "textarea#user_profile_work_history[name=?]", "user_profile[work_history]"
      assert_select "textarea#user_profile_personal[name=?]", "user_profile[personal]"
    end
  end
end
