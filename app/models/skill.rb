class Skill < ActiveRecord::Base
  belongs_to :skill
  belongs_to :parent_skill, :class_name => "Skill", :foreign_key => :skill_id
  has_many :skills

  belongs_to :user
  belongs_to :job
  belongs_to :worklist
end
