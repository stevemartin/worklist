class ExperiencePresenter
  attr_accessor :experience

  def initialize experience
    @experience = experience
  end

  def attributes
    {
      id: experience.id,
      heading: experience.heading,
      content: experience.content,
      display_order: experience.display_order
    }
  end

end
