class SkillPresenter
  attr_accessor :skill

  def initialize skill
    @skill = skill
  end

  def attributes
    {
      id: skill.id,
      key_skill: skill.key_skill,
      title: skill.title,
      display_order: skill.display_order
    }
  end

end
