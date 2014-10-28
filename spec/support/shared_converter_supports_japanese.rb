# encoding: utf-8

require 'spec_helper'

shared_examples 'a converter supports japanese' do |encoding|
  include ConverterHelper

  subject(:converter) { described_class.new(encoding) }

  describe '#convert' do
    it 'converts hiragana な to にゃ' do
      new_source = convert_source(converter, encoding, 'な')
      expect(new_source).to eq('にゃ'.encode(encoding))
      new_source = convert_source(converter, encoding,
                                  'ななめななじゅうななどの' \
                                  'ならびでなくなくいななく' \
                                  'ななはんななだいなんなく' \
                                  'ならべてながながめ')
      expect(new_source).to eq('にゃにゃめにゃにゃじゅうにゃにゃどの' \
                               'にゃらびでにゃくにゃくいにゃにゃく' \
                               'にゃにゃはんにゃにゃだいにゃんにゃく' \
                               'にゃらべてにゃがにゃがめ'.encode(encoding))
    end

    it 'converts katakana ナ to ニャ' do
      new_source = convert_source(converter, encoding, 'ナ')
      expect(new_source).to eq('ニャ'.encode(encoding))
      new_source = convert_source(converter, encoding,
                                  'ナナメナナジュウナナドノ' \
                                  'ナラビデナクナクイナナク' \
                                  'ナナハンナナダイナンナク' \
                                  'ナラベテナガナガメ')
      expect(new_source).to eq('ニャニャメニャニャジュウニャニャドノ' \
                               'ニャラビデニャクニャクイニャニャク' \
                               'ニャニャハンニャニャダイニャンニャク' \
                               'ニャラベテニャガニャガメ'.encode(encoding))
    end
  end
end
