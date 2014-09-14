require 'open-uri'

module ExposureLoader
  def recent_exposure_uri
    "http://static.nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-modified.xml"
  end
end
namespace :db do
  desc "Download Newest exposure data"
  task download_recent_exposures: :environment do
    include ExposureLoader
    doc = Nokogiri::XML(open(recent_exposure_uri))
  end

end

