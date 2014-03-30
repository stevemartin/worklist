module Api
  module V1
    class UserProfilePresenter
      attr_accessor :profile, :output_type
      def initialize profile
        @profile = profile
      end

      def as_json array = false
        attributes(array).to_json
      end

      def attributes array = false
        @output_type = :array if array == :array
        {
          id: @profile.id,
          address: @profile.address,
          career_objectives: @profile.career_objectives,
          email: @profile.email,
          jobs_attributes: jobs_attributes,
          qualifications_attributes: qualifications_attributes,
          skills_attributes: skills_attributes,
          summary: @profile.summary,
          title: @profile.title,
          url: @profile.url,
          url_key: @profile.url_key
        }
      end

      private
      def jobs_attributes
        @output_type == :array ? attrs = [] : attrs = {}
        @profile.jobs.each do |job|
          presented_job = JobPresenter.new(job)
          attrs << presented_job.attributes(:array) if @output_type == :array
          attrs[job.id] = presented_job.attributes unless @output_type == :array
        end
        attrs
      end

      def qualifications_attributes
        @output_type == :array ? attrs = [] : attrs = {}
        @profile.qualifications.each do |qualification|
          presented_qualification = QualificationPresenter.new(qualification)
          attrs << presented_qualification.attributes if @output_type == :array
          attrs[qualification.id] = presented_qualification.attributes unless @output_type == :array
        end
        attrs
      end

      def skills_attributes
        @output_type == :array ? attrs = [] : attrs = {}
        @profile.skills.each do |skill|
          presented_skill = SkillPresenter.new(skill)
          attrs << presented_skill.attributes if @output_type == :array
          attrs[skill.id] = presented_skill.attributes unless @output_type == :array
        end
        attrs
      end

    end
  end
end
