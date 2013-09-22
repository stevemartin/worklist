class User::Profile < ActiveRecord::Base
  self.table_name = 'profiles'
  belongs_to :user
  has_many :skills
  has_many :jobs
  has_many :qualifications

  accepts_nested_attributes_for :skills, :jobs, :qualifications, allow_destroy: true
end
