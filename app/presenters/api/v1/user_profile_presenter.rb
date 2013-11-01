module Api
  module V1
    class UserProfilePresenter
      attr_accessor :profile
      def initialize profile
        @profile = profile
      end

      def as_json a = nil
        attributes.to_json
      end

      def attributes
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
        attrs = {}
        @profile.jobs.each do |job|
          presented_job = JobPresenter.new(job)
          attrs[job.id] = presented_job.attributes
        end
        attrs
      end

      def qualifications_attributes
        attrs = {}
        @profile.qualifications.each do |qualification|
          presented_qualification = QualificationPresenter.new(qualification)
          attrs[qualification.id] = presented_qualification.attributes
        end
        attrs
      end

      def skills_attributes
        attrs = {}
        @profile.skills.each do |skill|
          presented_skill = SkillPresenter.new(skill)
          attrs[skill.id] = presented_skill.attributes
        end
        attrs
      end

    end
  end
end
