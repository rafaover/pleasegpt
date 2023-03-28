# rubocop:disable Metrics/MethodLength
require 'openai'

# Module for PleaseGPT gem
module PleaseGPT
  autoload :CLI, 'pleasegpt/cli'

  # Module for OpenAI API requests
  module Api
    def self.generate_text(input)
      response = OpenAI::Completion.create(
        engine: 'davinci',
        prompt: "#{input}\n",
        max_tokens: 2048,
        temperature: 0.5,
        n: 1,
        stop: "\n",
        api_key: api_key
      )
      Error.check_response(response)
      response.choices[0].text.strip.colorize(:blue)
    end

    private_class_method def self.api_key
      @api_key ||= ENV['OPENAI_API_KEY'] || begin
        ask('Please enter your OpenAI API key:  ') { |q| q.echo = '*' }
      end
    end
  end

  # Handling errors from OpenAI API requests and responses
  module Error
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
