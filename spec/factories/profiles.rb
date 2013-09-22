# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile, :class => 'User::Profile' do
    url '1'
    first_name "MyString"
    middle_names "MyString"
    last_name "MyString"
    title "My Title"
    date_of_birth "2013-08-17 11:48:22"
    email "MyString"
    website "MyString"
    landline_phone "MyString"
    mobile_phone "MyString"
    description "MyText"
    education "MyText"
    work_history "MyText"
    personal "MyText"
  end
end
