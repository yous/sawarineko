# encoding: utf-8

module Sawarineko
  # Convert plain text to Sawarineko text.
  class Converter
    # Array of convertible character code on EUC-KR encoding.
    CONVERTIBLE_EUC_KR =
      %w(나 낙 난 날 남 낭).map { |ch| ch.encode(Encoding::EUC_KR).ord }.freeze
    private_constant :CONVERTIBLE_EUC_KR

    # Initialize a Converter. Get the encoding of source. Initialize Regexps for
    # conversion.
    #
    # encoding - The Encoding of source (default: Encoding::UTF_8).
    def initialize(encoding = Encoding::UTF_8)
      @encoding = Encoding.find(encoding)
      @hiragana_regex = Regexp.new('な'.encode(@encoding)).freeze
      @katakana_regex = Regexp.new('ナ'.encode(@encoding)).freeze
      @hangul_regex = case @encoding
                      when Encoding::UTF_8, Encoding::UTF_16BE,
                           Encoding::UTF_16LE, Encoding::EUC_KR
                        Regexp.new('[나-낳]'.encode(@encoding)).freeze
                      when Encoding::CP949
                        Regexp.new('[나-낳낛-낤낥-낲]'.encode(@encoding)).freeze
                      end
    end

    # Convert the source.
    #
    # source - The String source to convert.
    #
    # Returns the String converted to Sawarineko.
    def convert(source)
      new_source = source.gsub(@hiragana_regex, 'にゃ'.encode(@encoding).freeze)
                         .gsub(@katakana_regex, 'ニャ'.encode(@encoding).freeze)
      if @hangul_regex
        new_source.gsub(@hangul_regex) { |ch| convert_hangul(ch) }
      else
        new_source
      end
    end

    private

    # Convert a hangul character to Sawarineko.
    #
    # ch - A hangul character to convert.
    #
    # Returns the converted character.
    def convert_hangul(ch)
      if @encoding == Encoding::EUC_KR && !CONVERTIBLE_EUC_KR.include?(ch.ord)
        return ch
      end
      (ch.encode(Encoding::UTF_8).ord + 56).chr(Encoding::UTF_8)
                                           .encode(@encoding)
    end
  end
end
