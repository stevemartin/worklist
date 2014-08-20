class Job < ActiveRecord::Base
  # belongs_to :address
  belongs_to :user
  belongs_to :worklist
  has_many :skills
  has_many :experiences
  accepts_nested_attributes_for :experiences, :skills, allow_destroy: true
end
