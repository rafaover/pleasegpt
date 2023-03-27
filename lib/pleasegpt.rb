#!/usr/bin/env ruby
require 'openai'

# Set up OpenAI API client. Add your OpenAI secret key here.
openai_secret_key = 'YOUR_SECRET_KEY_HERE'
OpenAI.api_key = openai_secret_key

# Define function to send user input to OpenAI API and return response
def pleasegpt(input)
  response = OpenAI::Completion.create(
    engine: 'davinci',
    prompt: "#{input}\n",
    max_tokens: 300,
    temperature: 0,
    n: 1,
    stop: "\n"
  )
  return response.choices[0].text.strip
end

# Read user input from command line and respond using OpenAI API
if true
  print "pleasegpt> "
  input = gets.chomp
  input.empty? ? break : puts pleasegpt(input)
end
