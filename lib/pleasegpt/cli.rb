# rubocop:disable Metrics/MethodLength
require 'openai'
require 'highline/import'

module PleaseGPT
  # call error when API request returns empty response or nil text
  class Error < StandardError
    def self.check_response(response)
      if response.choices.empty?
        raise PleaseGPT::Error, "OpenAI API request returned empty response"
      elsif response.choices[0].text.nil?
        raise PleaseGPT::Error, "OpenAI API request returned nil text"
      end
    end
  end

  # CLI class for PleaseGPT gem
  class CLI
    def run
      print 'pleasegpt> '
      input = gets.chomp
      if input.empty?
        puts 'Please enter a valid command'
        run
      end
      puts pleasegpt(input)
    end

    # call OpenAI API and return response
    def pleasegpt(input)
      response = OpenAI::Completion.create(
        engine: 'davinci',
        prompt: "#{input}\n",
        max_tokens: 2048,
        temperature: 0.5,
        n: 1,
        stop: "\n",
        api_key: ENV['OPENAI_API_KEY']
      )
      Error.check_response(response)
      response.choices[0].text.strip
    end

    private

    def api_key
      @api_key ||= ENV['OPENAI_API_KEY'] || ask('Please enter your OpenAI API key:  ') { |q| q.echo = "*" }
    end
  end
end
# rubocop:enable Metrics/MethodLength
