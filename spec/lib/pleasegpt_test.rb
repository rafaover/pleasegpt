require 'spec_helper'
require 'pleasegpt'

describe PleaseGPT::Api do
  describe '.generate_text' do
    context 'with valid input' do
      let(:input) { 'which command do I use to fetch a github repository?' }

      it 'returns a non-empty response from the API' do
        PleaseGPT::Api.save_api_key('test-api-key') # save the test API key
        output = PleaseGPT::Api.generate_text(input)
        expect(output).not_to be_empty
      end
    end
  end

  describe '.save_api_key' do
    it 'saves the API key to the correct file' do
      key = 'test-api-key'
      PleaseGPT::Api.save_api_key(key)
      expect(File.read('lib/.openai')).to eq("OPENAI_API_KEY=#{key}")

      # Cleanup the file after the test
      File.delete('lib/.openai')
    end
  end

  describe '.load_api_key' do
    context 'with valid input' do
      let(:key) { 'test-api-key' }

      it 'sets the OPENAI_API_KEY environment variable' do
        PleaseGPT::Api.load_api_key(key)
        expect(ENV['OPENAI_API_KEY']).to eq(key)
      end
    end
  end
end
