class Api::V1::WorklistPresenter
  attr_reader :user_profile

  def initialize user_profile
    @user_profile = user_profile
  end

  def as_json a = nil
    attributes.to_json
  end

  alias_method :to_json, :as_json

  def attributes
    { user_profile: UserProfilePresenter.new( @user_profile ).attributes }
  end
end
