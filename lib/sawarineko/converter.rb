# encoding: utf-8

module Sawarineko
  # Convert plain text to Sawarineko text.
  class Converter
    # Initialize a Converter. Get a String source.
    #
    # source - The String source to convert.
    def initialize(source)
      @source = source
    end

    # Convert the source.
    #
    # Returns the String converted to Sawarineko.
    def convert
      @source
        .gsub(/な/, 'にゃ')
        .gsub(/[나-낳]/) { |ch| (ch.ord + 56).chr(Encoding::UTF_8) }
    end
  end
end
