module Api
  module V1
    class JobPresenter

      attr_accessor :job, :output_type

      def initialize job
        @job = job
      end

      def as_json( array = false )
        attributes(array)
      end

      def attributes( array = false )
        @output_type = :array if array == :array
        {
          id: @job.id,
          address:@job.address,
          description:@job.description,
          employer: @job.employer,
          employer_description: @job.employer_description,
          end_date: @job.end_date,
          skills_attributes: ( @output_type == :array ? skills_attribute_array : skills_attribute_hash ),
          start_date: @job.start_date,
          title: @job.title
        }
      end

      private
      def skills_attribute_hash
        attrs = {}
        @job.skills.each do |skill|
          presented_skill = Api::V1::SkillPresenter.new(skill)
          attrs[skill.id] = presented_skill.attributes
        end
        attrs
      end

      def skills_attribute_array
        attrs = []
        @job.skills.each do |skill|
          presented_skill = Api::V1::SkillPresenter.new(skill)
          attrs << presented_skill.attributes
        end
        attrs
      end

    end
  end
end

