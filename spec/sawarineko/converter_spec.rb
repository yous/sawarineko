# encoding: utf-8

require 'spec_helper'

RSpec.describe Sawarineko::Converter do
  subject(:converter) { described_class.new }

  it 'converts hiragana な to にゃ' do
    expect(converter.convert('な')).to eq('にゃ')
    expect(converter.convert('ななめななじゅうななどのならびで' \
                             'なくなくいななくななはんななだい' \
                             'なんなくならべてながながめ'))
      .to eq('にゃにゃめにゃにゃじゅうにゃにゃどのにゃらびで' \
             'にゃくにゃくいにゃにゃくにゃにゃはんにゃにゃだい' \
             'にゃんにゃくにゃらべてにゃがにゃがめ')
  end

  it 'converts katakana ナ to ニャ' do
    expect(converter.convert('ナ')).to eq('ニャ')
    expect(converter.convert('ナナメナナジュウナナドノナラビデ' \
                             'ナクナクイナナクナナハンナナダイ' \
                             'ナンナクナラベテナガナガメ'))
      .to eq('ニャニャメニャニャジュウニャニャドノニャラビデ' \
             'ニャクニャクイニャニャクニャニャハンニャニャダイ' \
             'ニャンニャクニャラベテニャガニャガメ')
  end

  it 'converts hangul 나-낳 to 냐-냫' do
    ('나'..'낳').zip('냐'..'냫').each do |na, nya|
      expect(converter.convert(na)).to eq(nya)
    end
    expect(converter.convert('나랑 너랑 봄나들이 배낭 매고 봄나들이 ' \
                             '버드나무 낭창낭창 남실바람 남실남실 ' \
                             '개나리 꽃에 나비가 하나 ' \
                             '배낭 속에 바나나가 하나'))
      .to eq('냐랑 너랑 봄냐들이 배냥 매고 봄냐들이 ' \
             '버드냐무 냥창냥창 냠실바람 냠실냠실 ' \
             '개냐리 꽃에 냐비가 하냐 ' \
             '배냥 속에 바냐냐가 하냐')
  end
end
