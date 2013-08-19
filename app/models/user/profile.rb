class User::Profile < ActiveRecord::Base
  self.table_name = 'profiles'
  belongs_to :user
  has_many :skills
  has_many :jobs

  accepts_nested_attributes_for :skills, :jobs, allow_destroy: true
end
