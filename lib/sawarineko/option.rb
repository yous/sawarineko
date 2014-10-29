# encoding: utf-8

require 'optparse'

module Sawarineko
  # Handle command line options.
  class Option
    # Initialize a Option.
    def initialize
      @options = { encoding: Encoding::UTF_8 }
    end

    # Parse the passed arguments to a Hash.
    #
    # args - An Array of Strings containing options.
    #
    # Returns an Array contains of a Hash options and an Array of Strings
    #   remaining arguments.
    def parse(args)
      OptionParser.new do |opts|
        opts.banner = 'Usage: sawarineko [options] [source]'

        add_options(opts)
        add_options_on_tail(opts)
      end.parse!(args)
      [@options, args]
    end

    private

    # Add command line options.
    #
    # opts - An OptionParser object to add options.
    #
    # Returns nothing.
    def add_options(opts)
      opts.on('-e', '--encoding ENCODING',
              'Specify the encoding of input.') do |encoding|
        @options[:encoding] = encoding
      end
    end

    # Add command line options printed at tail.
    #
    # opts - An OptionParser object to add options.
    #
    # Returns nothing.
    def add_options_on_tail(opts)
      opts.on_tail('-h', '--help', 'Print this message.') do
        puts opts
        exit 0
      end

      opts.on_tail('-v', '--version', 'Print version.') do
        puts Version::STRING
        exit 0
      end
    end
  end
end
