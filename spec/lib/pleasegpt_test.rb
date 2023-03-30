require 'spec_helper'
require 'pleasegpt'

RSpec.describe PleaseGPT::Api do
  describe '#generate_text' do
    let(:input) { 'Some prompt for GPT' }
    let(:response_text) { 'Generated text' }

    before do
      allow_any_instance_of(OpenAI::Client)
        .to receive(:completions)
        .and_return('choices' => [{ 'text' => response_text }])
    end

    it 'returns a non-empty response' do
      response = PleaseGPT::Api.generate_text(input)
      expect(response).not_to be_empty
      expect(response).to eq(response_text)
    end
  end
end
