require 'pleasegpt'
require 'colorize'
require 'dotenv/load'

module PleaseGPT
  class CLI
    def save_api_key
      if Api.api_key
        File.write('.openai', Api.api_key)
        puts 'OpenAI API key saved to .openai file'
      else
        puts 'OpenAI API key not found in environment variables'
      end
    end

    def load_api_key
      if File.exist?('.openai')
        key = File.read('.openai').strip
        ENV['OPENAI_API_KEY'] = key
        puts 'OpenAI API key loaded from .openai file'
      else
        puts 'No .openai file found'
      end
    end

    def start(args)
      load_api_key
      if args.empty?
        puts 'Please enter a valid command'
      else
        input = args.join(' ')
        puts Api.generate_text(input).to_s.colorize(:blue)
      end
    end
  end
end
