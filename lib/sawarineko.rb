# encoding: utf-8

require 'sawarineko/version'
require 'sawarineko/converter'
require 'sawarineko/option'
require 'sawarineko/cli'

# Get your Nya!
module Sawarineko
  # Make the source to Sawarineko. See Converter.
  #
  # source - The String source to convert.
  #
  # Returns the String converted to Sawarineko.
  def self.nya(source)
    Converter.new.convert(source)
  end
end
