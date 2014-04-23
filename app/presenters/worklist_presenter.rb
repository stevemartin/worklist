class WorklistPresenter
  attr_accessor :worklist, :output_type
  def initialize worklist
    @worklist = worklist
  end

  def as_json array = false
    attributes(array).to_json
  end

  def attributes array = false
    @output_type = :array if array == :array
    {
      id: @worklist.id,
      address: @worklist.address,
      career_objectives: @worklist.career_objectives,
      email: @worklist.email,
      jobs_attributes: jobs_attributes,
      qualifications_attributes: qualifications_attributes,
      skills_attributes: skills_attributes,
      summary: @worklist.summary,
      title: @worklist.title,
      url: @worklist.url,
      url_key: @worklist.url_key
    }
  end

  private
  def jobs_attributes
    @output_type == :array ? attrs = [] : attrs = {}
    @worklist.jobs.each do |job|
      presented_job = JobPresenter.new(job)
      attrs << presented_job.attributes(:array) if @output_type == :array
      attrs[job.id] = presented_job.attributes unless @output_type == :array
    end
    attrs
  end

  def qualifications_attributes
    @output_type == :array ? attrs = [] : attrs = {}
    @worklist.qualifications.each do |qualification|
      presented_qualification = QualificationPresenter.new(qualification)
      attrs << presented_qualification.attributes if @output_type == :array
      attrs[qualification.id] = presented_qualification.attributes unless @output_type == :array
    end
    attrs
  end

  def skills_attributes
    @output_type == :array ? attrs = [] : attrs = {}
    @worklist.skills.each do |skill|
      presented_skill = SkillPresenter.new(skill)
      attrs << presented_skill.attributes if @output_type == :array
      attrs[skill.id] = presented_skill.attributes unless @output_type == :array
    end
    attrs
  end

end
