require 'openai'
require 'highline/import'
require 'dotenv/load'
require 'dotenv'

# Main module for PleaseGPT gem
module PleaseGPT
  autoload :CLI, 'pleasegpt/cli'

  # API class for OpenAI API requests and responses
  module Api
    def self.api_key
      @api_key ||= ENV['OPENAI_API_KEY']
    end

    def self.load_api_key
      key = ask("Please paste your OpenAI API key:  ")
      if key.nil? || key.empty?
        puts "API Key cannot be empty. Please try again."
      else
        File.write('lib/.openai', "OPENAI_API_KEY=#{key}")
        puts 'API key saved to file'
        ENV['OPENAI_API_KEY'] = key
        Dotenv.load('.openai')
        puts "OPENAI_API_KEY=#{ENV['OPENAI_API_KEY']}"
      end
    end

    def self.generate_text(input)
      # raise "OPENAI_API_KEY not set" unless ENV['OPENAI_API_KEY']
      client = OpenAI::Client.new(api_key: PleaseGPT::Api.api_key)
      response = client.completions(
        engine: 'text-davinci-003',
        prompt: "#{input}",
        max_tokens: 300,
        temperature: 0.5,
        n: 1,
        stop: '.'
      )
      Error.check_response(response)
    end
  end

  # Error class for OpenAI API requests and response errors
  class Error < StandardError
    def self.check_response(response)
      if response.choices.empty?
        raise PleaseGPT::Error, 'Request returned empty response'
      elsif response.choices[0].text.nil?
        raise PleaseGPT::Error, 'Request returned nil text'
      else
        response.choices[0].text.strip
      end
    end
  end
end
