json.array!(@user_profiles) do |user_profile|
  json.extract! user_profile, :first_name, :middle_names, :last_name, :date_of_birth, :email_address, :website, :landline_phone, :mobile_phone, :description, :education, :work_history, :personal
  json.url user_profile_url(user_profile, format: :json)
end
