# Presents job objects
class JobPresenter
  attr_accessor :job, :output_type

  def initialize(job)
    @job = job
  end

  def as_json(array = false)
    attributes(array)
  end

  def attributes(array = false)
    @output_type = :array if array == :array
    {
      id:                     job.id,
      address:                job.address,
      description:            job.description,
      employer:               job.employer,
      employer_description:   job.employer_description,
      end_date:               job.end_date,
      skills_attributes:      set_skills_attributes,
      experiences_attributes: set_experiences_attributes,
      start_date:             job.start_date,
      title:                  job.title,
      display_order:          job.display_order
    }
  end

  private

  def set_skills_attributes
    @output_type == :array ? skills_attribute_array : skills_attribute_hash
  end

  def set_experiences_attributes
    @output_type == :array ? experiences_attribute_array : experiences_attribute_hash
  end

  def skills_attribute_hash
    attrs = {}
    @job.skills.order(:display_order).each do |skill|
      presented_skill = SkillPresenter.new(skill)
      attrs[skill.id] = presented_skill.attributes
    end
    attrs
  end

  def skills_attribute_array
    attrs = []
    @job.skills.order(:display_order).each do |skill|
      presented_skill = SkillPresenter.new(skill)
      attrs << presented_skill.attributes
    end
    attrs
  end

  def experiences_attribute_hash
    attrs = {}
    @job.experiences.order(:display_order).each do |experience|
      presented_experience = ExperiencePresenter.new(experience)
      attrs[experience.id] = presented_experience.attributes
    end
    attrs
  end

  def experiences_attribute_array
    attrs = []
    @job.experiences.order(:display_order).each do |experience|
      presented_experience = ExperiencePresenter.new(experience)
      attrs << presented_experience.attributes
    end
    attrs
  end
end
