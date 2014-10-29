# encoding: utf-8

require 'spec_helper'

RSpec.describe Sawarineko::CLI do
  include FileHelper
  include_context 'isolated environment'

  subject(:cli) { described_class.new }

  before(:example) { $stdout = StringIO.new }
  after(:example) { $stdout = STDOUT }

  it 'converts text file passed as an argument' do
    create_file('sawarineko.txt',
                ['ななめななじゅうななどの' \
                 'ならびでなくなくいななく' \
                 'ななはんななだいなんなく' \
                 'ならべてながながめ'])
    expect(cli.run(['sawarineko.txt'])).to be(0)
    expect($stdout.string).to eq('にゃにゃめにゃにゃじゅうにゃにゃどの' \
                                 'にゃらびでにゃくにゃくいにゃにゃく' \
                                 'にゃにゃはんにゃにゃだいにゃんにゃく' \
                                 "にゃらべてにゃがにゃがめ\n")
  end

  it 'converts string passed as an stdin argument' do
    allow($stdin).to receive(:read).once
                       .and_return('ななめななじゅうななどの' \
                                   'ならびでなくなくいななく' \
                                   'ななはんななだいなんなく' \
                                   'ならべてながながめ')
    expect(cli.run([])).to be(0)
    expect($stdout.string).to eq('にゃにゃめにゃにゃじゅうにゃにゃどの' \
                                 'にゃらびでにゃくにゃくいにゃにゃく' \
                                 'にゃにゃはんにゃにゃだいにゃんにゃく' \
                                 "にゃらべてにゃがにゃがめ\n")
  end

  describe '-e/--encoding' do
    it 'converts text file with given encoding' do
      create_file('sawarineko.txt',
                  ['ななめななじゅうななどの' \
                   'ならびでなくなくいななく' \
                   'ななはんななだいなんなく' \
                   'ならべてながながめ'.encode(Encoding::CP949)])
      expect(cli.run(['--encoding', 'cp949',
                      'sawarineko.txt'])).to be(0)
      expect($stdout.string).to eq('にゃにゃめにゃにゃじゅうにゃにゃどの' \
                                   'にゃらびでにゃくにゃくいにゃにゃく' \
                                   'にゃにゃはんにゃにゃだいにゃんにゃく' \
                                   "にゃらべてにゃがにゃがめ\n")
    end
  end
end
