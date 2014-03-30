module Api
  module V1
    class WorklistPresenter

      attr_accessor :output_type
      attr_reader :user_profile

      def initialize user_profile
        @user_profile = user_profile
      end

      def as_json array = false
        attributes(array).to_json
      end

      alias_method :to_json, :as_json

      def attributes array = false
        { user_profile: UserProfilePresenter.new( @user_profile ).attributes(array) }
      end
    end
  end
end
