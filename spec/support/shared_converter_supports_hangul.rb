# encoding: utf-8

require 'spec_helper'

shared_examples 'a converter supports hangul' do |encoding|
  include ConverterHelper

  subject(:converter) { described_class.new(encoding) }

  describe '#convert' do
    it 'converts hangul 나-낳 to 냐-냫' do
      ('나'..'낳').zip('냐'..'냫').each do |na, nya|
        new_source = convert_source(converter, encoding, na)
        expect(new_source).to eq(nya.encode(encoding))
      end
      new_source = convert_source(converter, encoding,
                                  '나랑 너랑 봄나들이 배낭 매고 봄나들이 ' \
                                  '버드나무 낭창낭창 남실바람 남실남실 ' \
                                  '개나리 꽃에 나비가 하나 ' \
                                  '배낭 속에 바나나가 하나')
      expect(new_source).to eq('냐랑 너랑 봄냐들이 배냥 매고 봄냐들이 ' \
                               '버드냐무 냥창냥창 냠실바람 냠실냠실 ' \
                               '개냐리 꽃에 냐비가 하냐 ' \
                               '배냥 속에 바냐냐가 하냐'.encode(encoding))
    end
  end
end
