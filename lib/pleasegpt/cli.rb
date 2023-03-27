module PleaseGPT
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

    private

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
      response.choices[0].text.strip
    end
  end
end
