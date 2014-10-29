# encoding: utf-8

require 'spec_helper'

RSpec.describe Sawarineko::Converter do
  include ConverterHelper

  describe '#initialize' do
    subject(:converter) { described_class.new }

    it 'stores default encoding' do
      encoding = converter.instance_variable_get(:@encoding)
      expect(encoding).to be(Encoding::UTF_8)
    end

    context 'with Encoding object' do
      subject(:converter) { described_class.new(encoding) }
      let(:encoding) { Encoding::UTF_16LE }

      it 'stores given encoding' do
        encoding = converter.instance_variable_get(:@encoding)
        expect(encoding).to be(Encoding::UTF_16LE)
      end
    end

    context 'with string encoding name' do
      subject(:converter) { described_class.new(encoding) }
      let(:encoding) { 'utf-16le' }

      it 'converts given name to Encoding object and stores' do
        encoding = converter.instance_variable_get(:@encoding)
        expect(encoding).to be(Encoding::UTF_16LE)
      end
    end

    context 'with string encoding alias name' do
      subject(:converter) { described_class.new(encoding) }
      let(:encoding) { 'eucKR' }

      it 'converts given name to Encoding object and stores' do
        encoding = converter.instance_variable_get(:@encoding)
        expect(encoding).to be(Encoding::EUC_KR)
      end
    end
  end

  context 'with UTF-8 encoding' do
    subject(:converter) { described_class.new(encoding) }
    let(:encoding) { Encoding::UTF_8 }
    it_behaves_like 'a converter supports japanese', Encoding::UTF_8
    it_behaves_like 'a converter supports hangul', Encoding::UTF_8

    it 'converts all languages at once' do
      new_source = convert_source(converter, encoding, %w(な ナ 나).join("\n"))
      expect(new_source).to eq(%w(にゃ ニャ 냐).join("\n").encode(encoding))
    end
  end

  context 'with UTF-16BE encoding' do
    it_behaves_like 'a converter supports japanese', Encoding::UTF_16BE
    it_behaves_like 'a converter supports hangul', Encoding::UTF_16BE
  end

  context 'with UTF-16LE encoding' do
    it_behaves_like 'a converter supports japanese', Encoding::UTF_16LE
    it_behaves_like 'a converter supports hangul', Encoding::UTF_16LE
  end

  context 'with EUC-JP encoding' do
    it_behaves_like 'a converter supports japanese', Encoding::EUC_JP
  end

  context 'with Shift_JIS encoding' do
    it_behaves_like 'a converter supports japanese', Encoding::Shift_JIS
  end

  context 'with EUC-KR encoding' do
    subject(:converter) { described_class.new(encoding) }
    let(:encoding) { Encoding::EUC_KR }
    it_behaves_like 'a converter supports japanese', Encoding::EUC_KR

    it 'converts hangul 나, 낙, 난, 날, 남, 낭 to 냐, 냑, 냔, 냘, 냠, 냥' do
      %w(나 낙 난 날 남 낭).zip(%w(냐 냑 냔 냘 냠 냥)).each do |na, nya|
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

    it 'preserves other hangul in range 나-낳' do
      %w(낚 낟 낡 낢 납 낫 났 낮 낯 낱 낳).each do |ch|
        new_source = convert_source(converter, encoding, ch)
        expect(new_source).to eq(ch.encode(encoding))
      end
    end
  end

  context 'with CP949 encoding' do
    it_behaves_like 'a converter supports japanese', Encoding::CP949
    it_behaves_like 'a converter supports hangul', Encoding::CP949
  end
end
