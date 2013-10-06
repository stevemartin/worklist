class Api::V1::SkillPresenter
  attr_accessor :skill

  def initialize skill
    @skill = skill
  end

  def attributes
    {
      key_skill: @skill.key_skill,
      title: @skill.title
    }
  end

end
