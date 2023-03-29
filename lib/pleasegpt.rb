require 'openai'
require 'highline/import'
require 'dotenv/load'

# Main module for PleaseGPT
module PleaseGPT
  autoload :CLI, 'pleasegpt/cli'

  # OpenAI API module requests
  module Api
    def self.api_key
      @api_key ||= ENV['OPENAI_API_KEY']
    end

    def self.load_api_key
      key = ask("Please enter your OpenAI API key:  ") { |q| q.echo = false }
      File.write('.openai', "OPENAI_API_KEY=#{key}")
      Dotenv.load
    end

    def self.generate_text(input)
      client = OpenAI::Client.new(api_key: Api.api_key)
      response = client.completions(
        engine: 'text-davinci-003',
        prompt: "#{input}",
        max_tokens: 300,
        temperature: 0,
        n: 1,
        stop: '.'
      )
      Error.check_response(response)
      response.choices[0].text.strip
    end
  end

  # Error class for OpenAI API requests
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
