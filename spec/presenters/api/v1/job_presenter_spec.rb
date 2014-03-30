require 'spec_helper'

describe Api::V1::JobPresenter do

  let(:skill) do
    OpenStruct.new(id:1,key_skill:"key_skill",title:"title")
  end

  let(:job) do
    OpenStruct.new(
          id: "@job.id",
          address:"@job.address",
          description:"@job.description",
          employer: "@job.employer",
          employer_description: "@job.employer_description",
          end_date: "@job.end_date",
          skills:[skill, skill],
          start_date: "@job.start_date",
          title: "@job.title"
    )
  end

  subject{ described_class.new( job ) }

  context 'when a hash' do
  subject{ described_class.new( job ) }
    it 'exposes the skills attributes as a hash' do
      subject.attributes[:skills_attributes].should == {1=>{:id=>1, :key_skill=>"key_skill", :title=>"title"}}
    end

    it 'exposes the skills attributes as a hash' do
      subject.attributes[:skills_attributes].should be_a Hash
    end
  end

  context 'when an array' do
    it 'exposes the skills attributes as an array' do
      subject.attributes(:array)[:skills_attributes].should == [{:id=>1, :key_skill=>"key_skill", :title=>"title"}, {:id=>1, :key_skill=>"key_skill", :title=>"title"}]
    end

    it 'exposes the skills attributes as an array' do
      subject.attributes(:array)[:skills_attributes].should be_a Array
    end

  end

end

