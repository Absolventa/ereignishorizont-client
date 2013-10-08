require 'spec_helper'

describe EventGirl::Client do

  subject { described_class.new('http://example.com/incoming_events', 'foobar') }

  context 'with class-level configuration' do
    %w(api_token url).each do |accessor|
      it { expect(described_class).to respond_to accessor }
      it { expect(described_class).to respond_to "#{accessor}=" }
    end

    describe '.configure' do
      it 'sets configuration via a block' do
        described_class.configure do |config|
          config.api_token = 'abcdef'
          config.url       = 'https://eg.example.com'
        end
        expect(described_class.api_token).to eql 'abcdef'
        expect(described_class.url).to eql 'https://eg.example.com'
      end
    end
  end

  it 'creates instances with two arguments' do
    expect(described_class.instance_method(:initialize).arity).to eql(-1)
  end

  it 'raises an error when url is omitted' do
    expect do
      described_class.new(nil, 'abc')
    end.to raise_error ArgumentError
  end

  it 'sets the api_token' do
    subject = described_class.new('', 'abcxyz')
    expect(subject.api_token).to eql 'abcxyz'
  end

  it 'sets the url' do
    subject = described_class.new('http://localhost:3000', nil)
    expect(subject.url).to eql 'http://localhost:3000'
  end

  describe '#send_event' do
    it 'still responds to send_event' do
      expect(subject).to respond_to :send_event
    end

    it 'delegates to #send!' do
      subject.should_receive(:send!).with('foo', 'bar')
      subject.send_event('foo', 'bar')
    end
  end

  describe '#send!' do
    it 'requires the event title and supports content optionally' do
      expect(subject.method(:send!).arity).to eql(-2)
    end

    it 'sends json data' do
      title = 'event girl test'
      json  = '{"api_token":"' + subject.api_token + '","incoming_event":{"title":"' + title + '","content":""}}'
      stub_request(:post, subject.url).
        with(body: json)
      subject.send! title
    end

    it 'allows sending of optional content' do
      title   = 'event girl test'
      content = 'this is additional payload data'
      json    = '{"api_token":"' + subject.api_token + '","incoming_event":{"title":"' + title + '","content":"' + content + '"}}'
      stub_request(:post, subject.url).
        with(body: json)
      subject.send! title, content
    end

    it 'sends json headers' do
      stub_request(:post, subject.url).
        with(
          headers: {
            'Accept'       => 'application/json',
            'Content-Type' => 'application/json'
          }
        )
      subject.send! 'event girl test'
    end
  end
end
