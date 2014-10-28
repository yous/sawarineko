# encoding: utf-8

module Sawarineko
  # Convert plain text to Sawarineko text.
  class Converter
    # Convert the source.
    #
    # source - The String source to convert.
    #
    # Returns the String converted to Sawarineko.
    def convert(source)
      source
        .gsub(/な/, 'にゃ')
        .gsub(/ナ/, 'ニャ')
        .gsub(/[나-낳]/) { |ch| (ch.ord + 56).chr(Encoding::UTF_8) }
    end
  end
end
