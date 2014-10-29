# encoding: utf-8

module Sawarineko
  # Handle command line interfaces logic.
  class CLI
    # Initialize a CLi.
    def initialize
      @options = {}
    end

    # Entry point for the application logic. Process command line arguments and
    # run the Sawarineko.
    #
    # args - An Array of Strings user passed.
    #
    # Returns an Integer UNIX exit code.
    def run(args = ARGV)
      @options, paths = Option.new.parse(args)
      source = if paths.empty?
                 $stdin.read
               else
                 IO.read(paths[0], encoding: @options[:encoding])
               end
      converter = Converter.new(@options[:encoding])
      puts converter.convert(source)
      0
    end
  end
end
