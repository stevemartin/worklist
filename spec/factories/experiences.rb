# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :experience do
    heading "MyString"
    content "MyText"
    start_date "2014-08-20 11:29:56"
    end_date "2014-08-20 11:29:56"
    worklist nil
    job nil
  end
end
