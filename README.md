# PleaseGPT

PleaseGPT is a Ruby gem that provides a simple wrapper around the OpenAI GPT-3 API. It allows you to generate natural language text based on a given prompt.

![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/rafaover/pleasegpt/ci.yml?style=for-the-badge)
![Gem](https://img.shields.io/gem/v/pleasegpt?style=for-the-badge)

## Requirements

A OpenAi API Key. Just go here, signup and create your key: <https://platform.openai.com/account/api-keys>.
Your key will be stored at `lib/.openai`

## Installation

To use PleaseGPT in your Ruby project, you can install it via Rubygems to use in your terminal:

```shell
gem install pleasegpt

# or add to your Gemfile:

gem 'pleasegpt'
```

## Usage

### If you gonna use special character in your input, use "your-input"

```shell
pleasegpt help                        # Show all commands
pleasegpt load-key                    # Save OpenAI key in a Env file. (Required)
pleasegpt "any text or question"      # Reply your request
pleasegpt -c "your question"          # When requesting a command, will reply only the command.
pleasegpt autocomplete "your-text"    # Complete your partial request
pleasegpt suggest "your-text"         # Suggest a new text based on your request
```

### In your code

Once you have an API key loaded in the environment, you can use the PleaseGPT::Api.generate_text method to generate text based on a prompt:

```ruby
require 'pleasegpt'

prompt = 'Explain Big O Notation for a 12 years old in less than 30 words'

response = PleaseGPT::Api.generate_text(prompt)  # To generate text responses in medium range.
response = PleaseGPT::Api.generate_command(prompt)  # To generate short responses, as a command.
puts response
```

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/rafaover/pleasegpt>.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor code of conduct.
