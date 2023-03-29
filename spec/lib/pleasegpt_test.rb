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

  describe PleaseGPT::Api do
    describe '.load_api_key' do
      context 'with valid input' do
        let(:key) { 'test-api-key' }

        it 'saves the API key to the correct file' do
          allow(PleaseGPT).to receive(:ask).and_return(key)
          puts ">>>>> COPY/PASTE test-api-key as the key below"
          puts ">>>>>"
          PleaseGPT::Api.load_api_key
          expect(File.read('lib/.openai')).to eq("OPENAI_API_KEY=#{key}")
        end

        it 'sets the OPENAI_API_KEY environment variable' do
          allow(PleaseGPT).to receive(:ask).and_return(key)
          puts ">>>>> COPY/PASTE test-api-key as the key below"
          puts ">>>>>"
          PleaseGPT::Api.load_api_key
          expect(ENV['OPENAI_API_KEY']).to eq(key)
        end
      end
    end
  end
end
