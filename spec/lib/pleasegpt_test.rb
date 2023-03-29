require 'spec_helper'
require 'pleasegpt'

describe PleaseGPT::Api do
  describe '.generate_text' do
    context 'with valid input' do
      let(:input) { 'What is the meaning of life?' }

      it 'returns a non-empty response from the API' do
        input = 'How much is 2+2?'
        api_key = ENV['OPENAI_API_KEY']
        output = PleaseGPT::Api.generate_text(input, api_key)
        expect(output).not_to be_empty
      end
    end
  end
end
