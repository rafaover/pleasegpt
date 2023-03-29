require 'spec_helper'
require 'pleasegpt/cli'

describe PleaseGPT::CLI do
  describe '#start' do
    let(:command) { "pleasegpt what's the meaning of life?" }

    it 'generates text from command input' do
      api_key = ENV['OPENAI_API_KEY']
      expected_output = PleaseGPT::Api.generate_text("what's the meaning of life?", api_key)
      expect(`#{command}`.strip).to eq(expected_output)
    end
  end
end
