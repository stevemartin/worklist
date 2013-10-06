class Api::V1::QualificationPresenter
  attr_accessor :qualification

  def initialize qualification
    @qualification = qualification
  end

  def as_json
    attributes
  end

  def attributes
    {
      grade:@qualification.grade,
      institute: @qualification.institute,
      title: @qualification.title,
    }
  end

end
