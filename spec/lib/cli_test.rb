require 'spec_helper'
require 'pleasegpt/cli'
require 'colorize'

RSpec.describe PleaseGPT::CLI do
  describe "#start" do
    context "when given a valid command" do
      let(:args) { ["how much is 2+2"] }

      it "returns a response from the OpenAI API, not empty, with blue colour" do
        expect { subject.start(args) }.to output(/.*\n/).to_stdout
        expect { subject.start(args) }.to output(/\S/).to_stdout
        expect { subject.start(args) }.to output(/\e\[0;34;49m.*\e\[0m\n/).to_stdout
      end
    end
  end
end
