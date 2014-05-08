require 'spec_helper'

describe Worklist do

  let(:uuid) { 'uuid-123' }

  context 'when creating' do

    subject { Worklist.create }

    before do
      SecureRandom.should_receive(:uuid).and_return(uuid)
      subject.stub(:id).and_return(1)
    end

    xit 'should generate url composite' do
      subject.url.should == 1.to_s(36)
      subject.url_key.should == uuid
    end

  end
end
