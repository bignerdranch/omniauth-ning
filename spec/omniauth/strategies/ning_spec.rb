require 'spec_helper'

describe OmniAuth::Strategies::Ning do
  let(:access_token) { double('AccessToken', options: {}) }
  let(:parsed_response) { stub('ParsedResponse') }
  let(:response) { stub('Response', parsed: parsed_response) }

  subject(:strategy) { described_class.new({}) }

  before do
    strategy.stub(:access_token) { access_token }
  end

  context "client options" do

    let(:client_options) { subject.options.client_options }

    it 'have the correct site' do
      expect(client_options.site).to eq("https://external.ningapis.com/xn/rest/YRGUniverse/1.0")
    end

    it 'have the correct authorize url' do
      expect(client_options.authorize_url).to eq('/Token')
    end

    it 'have  the correct token url' do
      expect(client_options.token_url).to eq('/Token')
    end
  end

  context "#raw_info" do
    it "should use relative paths" do
      strategy.stub_chain(:request, :params).and_return({ 'entry' => { 'author' => 'user123'} })
      expect(access_token).to receive(:get).with("/User?author=user123") { response }
      expect(subject.raw_info).to eq(parsed_response)
    end
  end

  context "environment" do
    before do
      # Can't stub super, so manually redefine
      class OmniAuth::Strategies::OAuth
        def call(env); nil; end
      end
    end

    it 'sets ning.strategy when run as middleware' do
      env = {}
      strategy.call(env)
      expect(env['ning.strategy']).to eq(strategy)
    end
  end
end