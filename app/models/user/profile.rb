class User::Profile < ActiveRecord::Base
  self.table_name = 'profiles'
  belongs_to :user
  has_many :skills, through: :user
  has_many :jobs, through: :user

  accepts_nested_attributes_for :skills, :jobs
end
