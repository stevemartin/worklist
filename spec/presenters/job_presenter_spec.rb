require 'spec_helper'

describe JobPresenter do

  let(:skill) do
    OpenStruct.new(id:1,key_skill:"key_skill",title:"title")
  end

  let(:experience) do
    OpenStruct.new(id:1,heading:"experience",content:"content")
  end

  let(:skills) do
    double(:skills, order: [skill, skill])
  end

  let(:experiences) do
    double(:experiences, order: [experience, experience])
  end

  let(:job) do
    OpenStruct.new(
          id: "@job.id",
          address:"@job.address",
          description:"@job.description",
          employer: "@job.employer",
          employer_description: "@job.employer_description",
          end_date: "@job.end_date",
          skills:skills,
          experiences:experiences,
          start_date: "@job.start_date",
          title: "@job.title"
    )
  end

  subject{ described_class.new( job ) }

  context 'when a hash' do
  subject{ described_class.new( job ) }
    it 'exposes the skills attributes as a hash' do
      subject.attributes[:skills_attributes].should == {1=>{:id=>1, :key_skill=>"key_skill", :title=>"title", :display_order=>nil}}
    end

    it 'exposes the skills attributes as a hash' do
      subject.attributes[:skills_attributes].should be_a Hash
    end
  end

  context 'when an array' do
    it 'exposes the skills attributes as an array' do
      subject.attributes(:array)[:skills_attributes].should == [{:id=>1, :key_skill=>"key_skill", :title=>"title", :display_order=>nil}, {:id=>1, :key_skill=>"key_skill", :title=>"title", :display_order=>nil}]
    end

    it 'exposes the skills attributes as an array' do
      subject.attributes(:array)[:skills_attributes].should be_a Array
    end

  end

end

