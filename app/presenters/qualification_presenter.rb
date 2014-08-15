# Presenter class for qualification records
class QualificationPresenter
  attr_accessor :qualification

  def initialize(qualification)
    @qualification = qualification
  end

  def as_json
    attributes
  end

  def attributes
    {
      id:        qualification.id,
      grade:     qualification.grade,
      institute: qualification.institute,
      title:     qualification.title
    }
  end
end
