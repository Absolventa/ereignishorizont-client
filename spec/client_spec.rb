require 'spec_helper'

describe EventGirl::Client do

  subject { described_class.new('http://example.com', 'foobar') }

  it 'creates instances with two arguments' do
    expect(described_class.instance_method(:initialize).arity).to eql 2
  end

  it 'sets the api_token' do
    subject = described_class.new(nil, 'abcxyz')
    expect(subject.api_token).to eql 'abcxyz'
  end

  it 'sets the url' do
    subject = described_class.new('http://localhost:3000', nil)
    expect(subject.url).to eql 'http://localhost:3000'
  end

  describe '#send_event' do
    it 'requires the event title as argument' do
      expect(subject.method(:send_event).arity).to eql 1
    end
  end
end
