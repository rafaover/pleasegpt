require 'spec_helper'
require 'pleasegpt'

describe PleaseGPT::Api do
  describe '.generate_text' do
    context 'with valid input' do
      let(:input) { 'which command do I use to fetch a github repository?' }

      it 'returns a non-empty response from the API' do
        input = 'which command do I use to fetch a github repository?'.strip
        output = PleaseGPT::Api.generate_text(input)
        expect(output).not_to be_empty
      end
    end
  end
end
