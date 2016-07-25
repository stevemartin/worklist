class Job < ActiveRecord::Base
  # belongs_to :address
  belongs_to :user
  belongs_to :worklist
  has_many :skills,      dependent: :destroy
  has_many :experiences, dependent: :destroy
  accepts_nested_attributes_for :experiences, :skills, allow_destroy: true
end
