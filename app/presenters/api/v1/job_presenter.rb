class Api::V1::JobPresenter

  attr_accessor :job

  def initialize job
    @job = job
  end

  def as_json
    attributes
  end

  def attributes
    {
      address:@job.address,
      description:@job.description,
      employer: @job.employer,
      employer_description: @job.employer_description,
      end_date: @job.end_date,
      skills_attributes: skills_attributes,
      start_date: @job.start_date,
      title: @job.title
    }
  end

  private
  def skills_attributes
    attrs = {}
    @job.skills.each do |skill|
      presented_skill = Api::V1::SkillPresenter.new(skill)
      attrs[skill.id] = presented_skill.attributes
    end
    attrs
  end

end
