require 'open-uri'

module ExposureLoader
  def recent_exposure_uri
    "http://static.nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-modified.xml"
  end

  def severity(number)
    return "" if number.to_f == 0.0

    case number.to_f
    when 0.0..4.0
      "#{number} Low"
    when 4.0..6.0
      "#{number} Medium"
    when 6.0..10.0
      "#{number} High"
    end
  end
end

namespace :db do
  desc "Download Newest exposure data"
  task download_recent_exposures: :environment do
    include ExposureLoader
    doc = Nokogiri::XML(open(recent_exposure_uri))

    puts doc.css("entry").count
    doc.css("entry").each_with_index do |e,index|
      exposure = Exposure.new({
        cve_id:                       e.xpath("vuln:cve-id").text,
        summary:                      e.xpath("vuln:summary").text,
        published:                    e.xpath("vuln:published-datetime").text,
        cvss_severity:                severity(e.xpath("vuln:cvss/cvss:base_metrics/cvss:score").text),
        title:                        e.xpath("vuln:summary").text[0..100] + " ...",
        cvss_v2_base_score:           e.xpath("vuln:cvss/cvss:base_metrics/cvss:score").text.to_i,
        impact_subscore:              1,
        exploitability_subscore:      1,
        access_vector:                e.xpath("vuln:cvss/cvss:base_metrics/cvss:access-vector").text,
        access_complexity:            "MyString",
        authentication:               "MyString",
        impact_type:                  "MyString",
        external_source_organization: "MyString",
        external_source_name:         "MyString",
        external_source_link:         "MyString"})

     unless exposure.save
      puts "#{exposure.errors.messages}"
      exposure.errors.messages.each{ |k,v| exposure[k] = "undefined" }
      exposure.save
     end
    end
    puts "#{Exposure.last.to_yaml}"
  end
end
