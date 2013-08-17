class User::Profile < ActiveRecord::Base
  self.table_name = 'profiles'
  belongs_to :user
end
