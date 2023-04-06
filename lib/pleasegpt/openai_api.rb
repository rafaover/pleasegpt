# frozen_string_literal: true

require 'dotenv'
require 'openai'

# rubocop:disable Metrics/MethodLength

# Main module for OpenAI Client
module OpenaiClient
  def self.openai_response(prompt, max_tokens, temperature, n, stop)
    response = openai_client_new.completions(
      parameters: {
        model: 'text-davinci-003',
        prompt: prompt,
        max_tokens: max_tokens,
        temperature: temperature,
        n: n,
        stop: stop
      }
    )
    PleaseGPT::Error.check_response(response)
  end

  def self.openai_client_new
    Dotenv.load(PleaseGPT::Api.join_lib_dir_with_file)
    raise PleaseGPT::Error, 'OPENAI_API_KEY not set' unless ENV['OPENAI_API_KEY']

    OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
  end
end

# rubocop:enable Metrics/MethodLength
