# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    employer "MyString"
    address nil
    start_date "2013-08-18 23:39:10"
    end_date "2013-08-18 23:39:10"
    title "MyString"
    employer_description "MyString"
    job_description "MyText"
  end
end
