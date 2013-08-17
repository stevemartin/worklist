# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  # sequence :email do |n|
  #   "email#{n}@factory.com"
  # end

  factory :user do
    sequence(:email) {|n| "email#{n}@factory.com" }
    sequence(:password) {|n| "password#{n}" }

  end

  factory :user_with_profile, :parent => :user do
    association :profile, factory: :profile
  end
end
