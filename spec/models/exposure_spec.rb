require 'rails_helper'

describe Exposure do

  def test_bad_inputs(obj, message)
    [1, "", "1", '1' * 501].each do |bad_input|
      obj.send(message, bad_input)
      expect(obj.valid?).to eq(false)
    end
  end

  context 'has a valid build factory' do
    subject { build(:exposure)}
    it { is_expected.to be_a(Exposure) }
  end

  context 'validation failures' do
    let(:exposure) { build(:exposure) }

    it "#summary" do
      test_bad_inputs(exposure, :summary=)
    end

    it "#published" do
      test_bad_inputs(exposure, :published=)
    end

    it "#title" do
      test_bad_inputs(exposure, :title=)
    end

    it "#access_vector" do
      test_bad_inputs(exposure, :access_vector=)
    end

    it "#access_complexity" do
      test_bad_inputs(exposure, :access_complexity=)
    end

    it "#authentication" do
      test_bad_inputs(exposure, :authentication=)
    end

    it "#impact_type" do
      test_bad_inputs(exposure, :impact_type=)
    end

    it "#web_link" do
      test_bad_inputs(exposure, :web_link=)
    end

    it "#external_source_organization" do
      test_bad_inputs(exposure, :external_source_organization=)
    end

    it "#external_source_name" do
      test_bad_inputs(exposure, :external_source_name=)
    end

    it "#external_source_link" do
      test_bad_inputs(exposure, :external_source_link=)
    end

    it "#cvss_v2_base_score" do
      exposure.cvss_v2_base_score = "string"
      expect(exposure.valid?).to eq(false)
    end

    it "#cvss_severity" do
      exposure.cvss_severity = "string"
      expect(exposure.valid?).to eq(false)
    end

    it "#impact_subscore" do
      exposure.impact_subscore= "string"
      expect(exposure.valid?).to eq(false)
    end

    it "#exploitability_subscore" do
      exposure.exploitability_subscore = "string"
      expect(exposure.valid?).to eq(false)
    end
  end
end
