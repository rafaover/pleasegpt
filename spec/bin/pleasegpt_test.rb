require 'pleasegpt/cli'

RSpec.describe PleaseGPT::CLI do
  describe '#start' do
    before do
      allow(described_class).to receive(:print)
      allow(described_class).to receive(:puts)
    end

    context 'when given valid input' do
      let(:input) { "I'm feeling lucky" }
      let(:output) { 'Some generated text' }

      before do
        allow(described_class).to receive(:gets).and_return(input)
        allow(PleaseGPT::Api).to receive(:generate_text).with(input).and_return(output)
      end

      it 'calls generate_text with the input and prints the output' do
        expect(described_class).to receive(:puts).with(output)
        described_class.start([])
      end
    end

    context 'when given empty input' do
      let(:input) { '' }

      before do
        allow(described_class).to receive(:gets).and_return(input, 'I want some text')
      end

      it 'prompts user for valid input' do
        expect(described_class).to receive(:puts).with('Please enter a valid command')
        described_class.start([])
      end
    end
  end
end
