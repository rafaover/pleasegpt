require 'ruby/openai'
require 'openai'
require 'highline/import'
require 'dotenv/load'
require 'dotenv'

# Main module for PleaseGPT gem
module PleaseGPT
  autoload :CLI, 'pleasegpt/cli'

  # API class for OpenAI API requests and responses
  module Api
    def self.load_api_key
      key = ask('Please paste your OpenAI API key:  ')
      if key.nil? || key.empty?
        puts 'API Key cannot be empty. Please try again.'
      else
        save_api_key(key)
        puts 'API key saved to file'
        env_variable(key)
      end
    end

    def self.gem_lib_dir
      File.expand_path(__dir__)
    end

    def self.join_lib_dir_with_file
      File.join(gem_lib_dir, '.openai')
    end

    def self.save_api_key(key)
      File.write(join_lib_dir_with_file, "OPENAI_API_KEY=#{key}")
    end

    def self.env_variable(key)
      File.open(join_lib_dir_with_file, 'w') do |f|
        f.puts "OPENAI_API_KEY=#{key}"
      end
    end

    def self.openai_client
      Dotenv.load('lib/.openai')
      raise 'OPENAI_API_KEY not set' unless ENV['OPENAI_API_KEY']

      OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
    end

    def self.generate_text(input)
      response = openai_client.completions(
        parameters: {
          model: 'text-davinci-003',
          prompt: input,
          max_tokens: 300,
          temperature: 0.5,
          n: 1,
          stop: '.'
        }
      )
      Error.check_response(response)
    end
  end

  # Error class for OpenAI API requests and response errors
  class Error < StandardError
    def self.check_response(response)
      if response['choices'].nil? || response['choices'].empty?
        raise PleaseGPT::Error, 'Request returned empty response'
      elsif response['choices'][0]['text'].nil?
        raise PleaseGPT::Error, 'Request returned nil text'
      else
        response['choices'][0]['text'].strip
      end
    end
  end
end
