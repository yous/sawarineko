# encoding: utf-8

require 'spec_helper'

RSpec.describe Sawarineko do
  subject(:sawarineko) { described_class }

  describe '#nya' do
    it { is_expected.to respond_to(:nya) }

    it 'converts string passed as an argument' do
      expect(sawarineko.nya('ななめななじゅうななどの' \
                            'ならびでなくなくいななく' \
                            'ななはんななだいなんなく' \
                            'ならべてながながめ'))
        .to eq('にゃにゃめにゃにゃじゅうにゃにゃどの' \
               'にゃらびでにゃくにゃくいにゃにゃく' \
               'にゃにゃはんにゃにゃだいにゃんにゃく' \
               'にゃらべてにゃがにゃがめ')
    end
  end
end
