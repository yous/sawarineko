# encoding: utf-8

# Helper methods for testing Converter.
module ConverterHelper
  # Convert the source with given encoding.
  #
  # converter - The Converter instance to process.
  # encoding  - The Encoding used in converter.
  # source    - The String source with UTF-8 encoding.
  #
  # Returns the converted source String.
  def convert_source(converter, encoding, source)
    converter.convert(source.encode(encoding))
  end
end
