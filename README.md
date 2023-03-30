# PleaseGPT

PleaseGPT is a Ruby gem that provides a simple wrapper around the OpenAI GPT-3 API. It allows you to generate natural language text based on a given prompt.

## Installation

To use PleaseGPT in your Ruby project, you can install it via Rubygems:

```
gem install pleasegpt

# or add to your Gemfile:

gem 'pleasegpt'
```

## Usage

To use PleaseGPT, you will need an API key from OpenAI. You can sign up for a free trial at https://platform.openai.com/signup/.

### If you at the command-line

```
pleasegpt help                      ## Show you all the commands available
pleasegpt load-key                  ## To save your OpenAI key in a Env file. (mandatory action)
pleasegpt <any text or question>    ## Will reply your request (no need to use <>)
```

### In your code

Once you have an API key, you can use the PleaseGPT::Api.generate_text method to generate text based on a prompt:

```
require 'pleasegpt'

api_key = 'your_api_key'
prompt = 'Hello, world!'

response = PleaseGPT::Api.generate_text(prompt, api_key: api_key)
puts response
```

# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rafaover/pleasegpt.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor code of conduct.
