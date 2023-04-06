# PleaseGPT

PleaseGPT is a Ruby gem that provides a simple wrapper around the OpenAI GPT-3 API. It allows you to generate natural language text based on a given prompt.

## Installation

To use PleaseGPT in your Ruby project, you can install it via Rubygems:

```shell
gem install pleasegpt

# or add to your Gemfile:

gem 'pleasegpt'
```

## Usage

To use PleaseGPT, you will need an API key from OpenAI. You can sign up for a free trial at <https://platform.openai.com/signup/>.

### If you at the command-line (no need to use the <> when writing prompt). If you gonna use special character in your input, use "your-input"

```shell
pleasegpt help                      ## Show you all the commands available
pleasegpt load-key                  ## To save your OpenAI key in a Env file. (mandatory action)
pleasegpt <any text or question>    ## Will reply your request (no need to use <>)
pleasegpt autocomplete <your-text>  ## Generate text by providing a partial prompt
pleasegpt suggest <your-text>       ## Generate text by providing a list of possible next words or phrases.
```

### In your code

Once you have an API key loaded in the environment, you can use the PleaseGPT::Api.generate_text method to generate text based on a prompt:

```ruby
require 'pleasegpt'

prompt = 'Explain Big O Notation for a 12 years old in less than 30 words'

response = PleaseGPT::Api.generate_text(prompt)
puts response
```

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/rafaover/pleasegpt>.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor code of conduct.
