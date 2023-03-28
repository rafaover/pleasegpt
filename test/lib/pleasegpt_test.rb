require 'dotenv'
Dotenv.load('.env')

describe PleaseGPT::Api do
  let(:api_key) { ENV['OPENAI_API_KEY'] }

  describe '#generate_text' do
    it 'raises an error if no API key is provided' do
      expect { PleaseGPT::Api.generate_text('test') }.to raise_error(StandardError, 'No OpenAI API key provided')
    end

    context 'when API key is provided' do
      before { allow(PleaseGPT::Api).to receive(:api_key).and_return(api_key) }

      it 'returns generated text' do
        expect(PleaseGPT::Api.generate_text('test')).not_to be_empty
      end

      it 'raises an error if API response is empty' do
        allow(OpenAI::Client).to receive(:new).and_return(double(completions: []))
        expect { PleaseGPT::Api.generate_text('test') }.to raise_error(PleaseGPT::Error, 'OpenAI API request returned empty response')
      end

      it 'raises an error if API response text is nil' do
        allow(OpenAI::Client).to receive(:new).and_return(double(completions: [OpenAI::Response.new]))
        expect { PleaseGPT::Api.generate_text('test') }.to raise_error(PleaseGPT::Error, 'OpenAI API request returned nil text')
      end
    end
  end
end

describe PleaseGPT::CLI do
  let(:cli) { PleaseGPT::CLI.new }

  describe '#start' do
    it 'returns a response to a question' do
      allow(cli).to receive(:gets).and_return('pleasegpt how can I fetch a repository from github?')
      expect { cli.start }.to output(/To fetch a repository from Github, you can use the 'git clone' command/).to_stdout
    end
  end
end
