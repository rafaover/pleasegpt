#!/usr/bin/env ruby
require 'openai'
require 'pleasegpt/cli'

module PleaseGPT
end

# Set up OpenAI API client. Add your OpenAI secret key here.
openai_secret_key = 'YOUR_SECRET_KEY_HERE'
OpenAI.api_key = openai_secret_key
