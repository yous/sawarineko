# encoding: utf-8

require 'sawarineko/version'
require 'sawarineko/converter'
require 'sawarineko/option'
require 'sawarineko/cli'

# Get your Nya!
module Sawarineko
  # Make the source to Sawarineko. See Converter.
  #
  # source   - The String source to convert.
  # encoding - The Encoding of the source (default: Encoding::UTF_8).
  #
  # Returns the String converted to Sawarineko.
  def self.nya(source, encoding = Encoding::UTF_8)
    Converter.new(encoding).convert(source)
  end
end
