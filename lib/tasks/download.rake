# "https://nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-2014.xml"
# "http://static.nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-modified.xml"

require 'exposure_loader'

namespace :db do
  desc "Download all exposure data"
  task download: :environment do
    include ExposureLoader
    download(ENV['NVD_URL'])
  end
end
