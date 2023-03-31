# frozen_string_literal: true

require 'spec_helper'
require 'pleasegpt'

# rubocop:disable Metrics/BlockLength

RSpec.describe PleaseGPT::Api do
  describe 'Api' do
    context 'when API key is valid' do
      let(:key) { 'valid_key' }

      before do
        allow(PleaseGPT::Api).to receive(:ask).and_return(key)
        allow(File).to receive(:write)
        allow(File).to receive(:open)
        allow(Dotenv).to receive(:load)
      end

      it 'saves the API key to the file' do
        expect(PleaseGPT::Api).to receive(:save_api_key).with(key)
        PleaseGPT::Api.load_api_key
      end

      it 'sets the OPENAI_API_KEY environment variable' do
        expect(PleaseGPT::Api).to receive(:env_variable).with(key)
        PleaseGPT::Api.load_api_key
      end
    end

    context 'when API key is empty' do
      it 'does not save the API key to the file' do
        allow(PleaseGPT::Api).to receive(:ask).and_return('')
        expect { PleaseGPT::Api.load_api_key }.to output("API Key cannot be empty. Please try again.\n").to_stdout
      end
    end

    describe '.generate_text' do
      before do
        allow(PleaseGPT::Api).to receive(:openai_client).and_return(client)
        allow(PleaseGPT::Error).to receive(:check_response).and_return('output text')
      end

      let(:client) { double('client') }

      it 'returns generated text' do
        expect(client).to receive(:completions)
        expect(PleaseGPT::Api.generate_text('prompt')).to eq('output text')
      end
    end

    describe '.openai_client' do
      let(:api_key) { 'key123' }
      let(:client) { double('client') }

      before do
        ENV['OPENAI_API_KEY'] = api_key
        allow(OpenAI::Client).to receive(:new).and_return(client)
      end

      it 'returns a new instance of OpenAI::Client' do
        expect(PleaseGPT::Api.openai_client).to eq(client)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
