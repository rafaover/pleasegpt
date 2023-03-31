# frozen_string_literal: true
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
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.color = true
  config.formatter = :documentation
end
