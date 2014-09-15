describe ':download_exposures' do
  let(:remote_uri) do
    "http://static.nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-modified.xml"
  end

  let(:header) do
    {'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Ruby'}
  end

  let!(:nvd_data) do
    File.open("spec/support/nvdcve-2.0-modified.xml") { |f| f.read }
  end

  before do
    RubySecurityApi::Application.load_tasks
    stub_request(:get,remote_uri )
      .with(headers: header)
      .to_return( status:  200,
                  body:    nvd_data,
                  headers: {})
  end

  it "can run without exception" do
    expect {
      Rake::Task['db:download_recent_exposures'].invoke
    }.not_to raise_exception
  end

  #
  # 1 out of 10 times this fails, wtf
  #
  it "can create 1 exposure per XML entry" do
    expect{
      Rake::Task['db:download_recent_exposures'].invoke
    }.to change{Exposure.count}.by(554)
  end
end
