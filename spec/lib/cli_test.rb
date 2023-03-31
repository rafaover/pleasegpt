# frozen_string_literal: true

require 'spec_helper'
require 'pleasegpt/cli'

RSpec.describe PleaseGPT::CLI do
  describe '#start' do
    context 'when given empty args' do
      let(:args) { [] }

      it 'returns an error message' do
        expected_output = ">>> Please enter a valid command <<<\n"
        expect { subject.start(args) }.to output(expected_output).to_stdout
      end
    end

    context 'when given a valid command receives a response in blue' do
      let(:args) { ['how much is 2+2?'] }

      before do
        allow(PleaseGPT::Api).to receive(:generate_text).with(args.join(' ')) do
          'The answer is 4.'
        end
      end

      it 'returns the response from the OpenAI API with blue colour' do
        expected_output = "\e[0;32;49mThe answer is 4.\e[0m\n"
        expect { subject.start(args) }.to output(expected_output).to_stdout
      end
    end
  end
end
