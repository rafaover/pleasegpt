require 'openai'
require 'highline/import'
require 'colorize'
require 'pleasegpt'

module PleaseGPT
  # Gem command-line tool interface
  class CLI
    def run
      print 'pleasegpt> '
      input = gets.chomp
      if input.empty?
        puts 'Please enter a valid command'
        run
      end
      puts Api.generate_text(input)
    end
  end
end
