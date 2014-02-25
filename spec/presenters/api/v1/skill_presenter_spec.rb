require 'spec_helper'

describe Api::V1::SkillPresenter do

  let(:skill) do
    OpenStruct.new(id:1,key_skill:"key_skill",title:"title")
  end

  subject{ described_class.new( skill ) }

  it 'exposes the skills attributes as a hash' do
    subject.attributes.should be_a Hash
  end

end
