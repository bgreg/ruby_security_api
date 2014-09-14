require 'spec_helper'

describe ':download_exposures' do
  before { RubySecurityApi::Application.load_tasks }

  it "can run without exception" do
    stub_request(:get, "http://static.nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-modified.xml").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})

    expect {
      Rake::Task['db:download_recent_exposures'].invoke
    }.not_to raise_exception
  end

  it "can create 1 exposure per xml entry" do
    expect{
      Rake::Task['db:download_recent_exposures'].invoke
    }.to change{Exposure.count}.by(194)
  end

end
