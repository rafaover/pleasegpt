# frozen_string_literal: true

require 'spec_helper'
require 'pleasegpt'

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
  end
end
