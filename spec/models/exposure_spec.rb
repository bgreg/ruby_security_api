require 'rails_helper'

describe Exposure do

  context 'has a valid build factory' do
    subject { build(:exposure)}
    it { is_expected.to be_a(Exposure) }
  end
end
