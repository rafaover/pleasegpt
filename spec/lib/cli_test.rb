require 'spec_helper'
require 'pleasegpt/cli'

RSpec.describe PleaseGPT::CLI do
  describe "#start" do
    context "when given a valid command" do
      let(:args) { ["how much is 2+2"] }

      it "returns a response from the OpenAI API" do
        expect { subject.start(args) }.to output(/.*\n/).to_stdout
      end
    end
  end
end
