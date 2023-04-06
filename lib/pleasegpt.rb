# frozen_string_literal: true

require_relative 'pleasegpt/version'
require_relative 'pleasegpt/gems'
require_relative 'pleasegpt/openai_api'

# Main module for PleaseGPT gem
module PleaseGPT
  autoload :CLI, 'pleasegpt/cli'

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

  # Main module for Dirs and loading/Saving API key
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

    def self.gem_dir
      File.expand_path('..', __dir__)
    end

    def self.join_lib_dir_with_file
      File.join(gem_dir, 'lib', '.openai')
    end

    def self.save_api_key(key)
      File.write(join_lib_dir_with_file, "OPENAI_API_KEY=#{key}")
    end

    def self.env_variable(key)
      File.open(join_lib_dir_with_file, 'w') do |f|
        f.puts "OPENAI_API_KEY=#{key}"
      end
    end

    def self.generate_text(input)
      OpenaiClient.openai_response(input, 300, 0.5, 1, '.')
    end

    def self.generate_command(input)
      OpenaiClient.openai_response(input, 100, 0.5, 1, '\n')
    end
  end
end
