require 'rspec'
require 'pleasegpt'
require 'dotenv/load'

unless ENV['OPENAI_API_KEY']
  # Prompt the user to enter their API key
  puts 'Please enter your OpenAI API key: '
  api_key = gets.chomp

  # Set the environment variable for the current process
  ENV['OPENAI_API_KEY'] = api_key
end

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end
