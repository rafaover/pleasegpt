require 'pleasegpt'

module PleaseGPT
  # Gem command-line tool interface
  class CLI
    def self.start(args)
      print 'pleasegpt> '
      input = gets.chomp
      if input.empty?
        puts 'Please enter a valid command'
        start(args)
      end
      puts Api.generate_text(input)
    end
  end
end
