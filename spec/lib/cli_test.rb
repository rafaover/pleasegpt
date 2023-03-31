require 'spec_helper'
require 'pleasegpt/cli'
require 'colorize'

RSpec.describe PleaseGPT::CLI do
  describe '#start' do
    context 'when given a valid command receives a response in blue' do
      let(:args) { ['how much is 2+2?'] }

      before do
        allow(PleaseGPT::Api).to receive(:generate_text).with(args.join(' ')) do
          'The answer is 4.'
        end
      end

      it 'returns a non-empty response from the OpenAI API with blue colour' do
        expect { subject.start(args) }.to output(/.*\n/).to_stdout
        expect { subject.start(args) }.to output(/\S/).to_stdout
        expect { subject.start(args) }.to output(/\e\[0;34;49m.*\e\[0m\n/).to_stdout
      end
    end
  end
end
