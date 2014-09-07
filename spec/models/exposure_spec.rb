require 'rails_helper'

describe Exposure do
  context 'has a valid build factory' do
    subject { build(:exposure)}
    it { is_expected.to be_a(Exposure) }
  end

  context 'validation' do
    let(:exposure) { build(:exposure) }

    it "fails when string is used instead of integer" do
      exposure.cvss_v2_base_score = "a string"
      expect(exposure.valid?).to be_false
    end
  end
end
