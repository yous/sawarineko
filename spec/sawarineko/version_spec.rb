# encoding: utf-8

require 'spec_helper'

RSpec.describe Sawarineko::Version do
  subject(:version) { described_class }

  describe '::STRING' do
    it { expect(defined? version::STRING).to eql('constant') }
  end
end
