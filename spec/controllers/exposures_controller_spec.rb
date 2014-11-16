require 'rails_helper'

describe ExposuresController do

  before do
    references = [create(:reference)]
    create(:exposure, reference: references)
  end

  context "#index" do
    before  { get :index }
    let(:parsed_body) { JSON.parse response.body }

    it "respond with 200 ok" do
      expect(response.status).to eq(200)
    end

    it "response should include root hash keys: others, and recents" do
      expect(parsed_body.keys).to match_array(['others','recents'])
      binding.pry
    end
  end

  context "#show" do
    subject {response}
  end

  context "#recent_count" do
    subject {response}
  end

  context "#recent_index" do
    subject {response}
  end

end
