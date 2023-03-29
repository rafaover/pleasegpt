# rubocop:disable Metrics/MethodLength
require 'openai'
require 'highline/import'
require 'yaml'
require 'dotenv/load'

# Module for PleaseGPT gem
module PleaseGPT
  autoload :CLI, 'pleasegpt/cli'

  # Module for OpenAI API requests
  module Api
    CONFIG_PATH = File.join(File.dirname(__FILE__), '..', 'config', 'config.yml')
    API_KEY_VAR_NAME = 'OPENAI_API_KEY'

    def self.api_key
      api_key = ENV[API_KEY_VAR_NAME]
      api_key = copy_api_key_from_config_file if api_key.nil?

      if api_key.nil?
        api_key = ask_api_key_from_user
        save_api_key_to_config_file(api_key)
      end

      api_key
    end

    def self.copy_api_key_from_config_file
      config = YAML.load_file(CONFIG_PATH)
      config['OPENAI_API_KEY']
    rescue StandardError
      nil
    end

    def self.save_api_key_to_config_file(api_key)
      config = YAML.load_file(CONFIG_PATH)
      config['OPENAI_API_KEY'] = api_key
      File.write(CONFIG_PATH, config.to_yaml)
    end

    def self.ask_api_key_from_user
      ask('Please enter your OpenAI API key:  ') { |q| q.echo = '*' }
    end

    def self.generate_text(input)
      client = OpenAI::Client.new(api_key: api_key)
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
