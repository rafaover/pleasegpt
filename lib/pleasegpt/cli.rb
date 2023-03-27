module PleaseGPT
  class CLI
    def run
      # while true
      #   print "pleasegpt> "
      #   input = gets.chomp
      #   if input.empty?
      #     break
      #   end
      #   puts pleasegpt(input)
      # end
      if true
        print "pleasegpt> "
        input = gets.chomp
        input.empty? ? break : puts pleasegpt(input)
      end
    end

    private

    def pleasegpt(input)
      response = OpenAI::Completion.create(
        engine: 'davinci',
        prompt: "#{input}\n",
        max_tokens: 2048,
        temperature: 0.5,
        n: 1,
        stop: "\n"
        api_key: ENV['OPENAI_API_KEY']
      )
      return response.choices[0].text.strip
    end
  end
end
