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
    # doc = Nokogiri::XML(open(recent_exposure_uri))

    file = File.open("spec/support/nvdcve-2.0-modified.xml") { |f| f.read }
    doc = Nokogiri::XML(file)
    doc.css("entry").each do |e|
      Exposure.create!({ summary: "MyString",
        published: "MyString",
        cvss_severity: 1,
        title: "MyString",
        cvss_v2_base_score: 1,
        impact_subscore: 1,
        exploitability_subscore: 1,
        access_vector: "MyString",
        access_complexity: "MyString",
        authentication: "MyString",
        impact_type: "MyString",
        external_source_organization: "MyString",
        external_source_name: "MyString",
        external_source_link: "MyString" })
    end
      puts Exposure.count
  end
end
