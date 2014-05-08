require 'spec_helper'

describe Worklist do

  let(:uuid) { 'uuid-123' }

  context 'when creating' do

    subject { Worklist.create }

    before do
      SecureRandom.should_receive(:uuid).and_return(uuid)
    end

    xit 'should generate url composite' do
      subject.url.should == subject.id.to_s(36)
      subject.url_key.should == uuid
    end

  end
end
