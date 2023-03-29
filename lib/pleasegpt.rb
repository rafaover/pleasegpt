# rubocop:disable Metrics/MethodLength
require 'openai'
require 'highline/import'
require 'colorize'
require 'dotenv/load'

# Module for PleaseGPT gem
module PleaseGPT
  autoload :CLI, 'pleasegpt/cli'

  # Module for OpenAI API requests
  module Api
    def self.api_key
      ENV['OPENAI_API_KEY'] || begin
        ask('Please enter your OpenAI API key:  ') { |q| q.echo = '*' }
      end
    end

    def self.generate_text(input, number)
      client = OpenAI::Client.new(access_token: number)
      response = client.completions(
        engine: 'text-davinci-001',
        prompt: "#{input}\n",
        max_tokens: 300,
        temperature: 0.5,
        n: 1,
        stop: "\n"
      )
      Error.check_response(response)
      response['choices'][0]['text'].strip.colorize(:blue)
    end
  end

  # Handling errors from OpenAI API requests and responses
  class Error < StandardError
    def self.check_response(response)
      if response.choices.empty?
        raise PleaseGPT::Error, 'OpenAI API request returned empty response'
      elsif response.choices[0].text.nil?
        raise PleaseGPT::Error, 'OpenAI API request returned nil text'
      end
    end
  end
end
# rubocop:enable Metrics/MethodLength
