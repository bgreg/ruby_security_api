require 'spec_helper'

describe ':download_exposures' do
  before { RubySecurityApi::Application.load_tasks }

  it "can run without exception" do
    expect {
      Rake::Task['db:download_exposures'].invoke
    }.not_to raise_exception
  end

end
