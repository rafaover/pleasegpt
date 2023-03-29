require 'pleasegpt'

module PleaseGPT
  # Gem command-line tool interface
  class CLI
    def start(args)
      if args.empty?
        puts 'Please enter a valid command'
      else
        input = args.join(' ')
        puts Api.generate_text(input).to_s.colorize(:blue)
      end
    end
  end
end
