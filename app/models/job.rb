class Job < ActiveRecord::Base
  # belongs_to :address
  belongs_to :user
  belongs_to :profile
  has_many :skills
  accepts_nested_attributes_for :skills
end