# frozen_string_literal: true

require 'pleasegpt'
require 'colorize'

module PleaseGPT
  # CLI class for the command-line tool interface
  class CLI
    def start(args)
      if args.empty?
        puts '>>> Please enter a valid command <<<'
      elsif args[0] == '-c'
        input = args[1..].join(' ')
        puts Api.generate_command(input).to_s.colorize(:green)
      else
        input = args.join(' ')
        puts Api.generate_text(input).to_s.colorize(:green)
      end
    end
  end
end
