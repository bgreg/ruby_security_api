require 'open-uri'

module ExposureLoader

  def download_recent
    old_total = Exposure.count
    download("http://static.nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-modified.xml")
    puts "\n\nNew Exposures added: #{Exposure.count - old_total}"
    report_download_statistics
  end

  def download_all
    download("https://nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-2014.xml")
    download("http://static.nvd.nist.gov/feeds/xml/cve/nvdcve-2.0-modified.xml")
    puts "\n\nTotal exposures: #{Exposure.count}"
    report_download_statistics
  end

  private

  def download(file)
    short_name = file.rpartition("/").last
    pb  = ProgressBar.create(smoothing: 0.6, title: "Parsing " + short_name , total: 1)
    doc = Nokogiri::XML(open(file))
    doc.css('entry').each  do |e|
      exposure            = parse_xml_into_exposure(e)
      refs                = parse_xml_into_references(e)
      exposure.references << refs
      if exposure.save
        pb.total += 1
        pb.increment
      end
    end
    pb.finish
    pb.stop
  end

  def report_download_statistics
    puts "Ruby records: #{Exposure.where(ruby: true).length}"
  end

  def parse_xml_into_exposure(e)
    exposure = Exposure.new({
      cve_id:                 cve_id(e),
      summary:                summary(e),
      published:              published(e),
      cvss_severity:          cvss_severity(e),
      title:                  title(e),
      cvss_v2_base_score:     cvss_v2_base_score(e),
      access_vector:          access_vector(e),
      access_complexity:      access_complexity(e),
      authentication:         authentication(e),
      integrity_impact:       integrity_impact(e),
      availablility_impact:   availablility_impact(e),
      confidentiality_impact: confidentiality_impact(e),
    })
    exposure.ruby = true if exposure.summary.match(/[Rr]uby/)
    exposure
  end

  def parse_xml_into_references(e)
    refs =[]
    e.xpath('vuln:references').each do |r|
      ref = Reference.new({
        source: r.xpath('vuln:source').text.presence || 'undefined',
        url:    r.xpath('vuln:reference').text.presence || 'undefined' })
      refs << ref
    end
    refs
  end

  def severity(number)
    return '' if number.to_f == 0.0

    case number.to_f
    when 0.0..4.0
      "#{number} Low"
    when 4.0..6.0
      "#{number} Medium"
    when 6.0..10.0
      "#{number} High"
    end
  end

  def summary(e)
    e.xpath('vuln:summary').text
  end

  def cve_id(e)
    e.xpath('vuln:cve-id').text
  end

  def published(e)
    e.xpath('vuln:published-datetime').text
  end

  def cvss_severity(e)
    severity(e.xpath('vuln:cvss/cvss:base_metrics/cvss:score').text)
  end

  def title(e)
    e.xpath('vuln:summary').text[0..100] + ' ...'
  end

  def cvss_v2_base_score(e)
    e.xpath('vuln:cvss/cvss:base_metrics/cvss:score').text.to_i
  end

  def access_vector(e)
    e.xpath('vuln:cvss/cvss:base_metrics/cvss:access-vector')
      .text
      .presence || 'undefined'
  end

  def access_complexity(e)
    e.xpath('vuln:cvss/cvss:base_metrics/cvss:access-complexity')
      .text
      .presence || 'undefined'
  end

  def authentication(e)
    e.xpath('vuln:cvss/cvss:base_metrics/cvss:access-authentication')
      .text
      .presence || 'undefined'
  end

  def integrity_impact(e)
    e.xpath('vuln:cvss/cvss:base_metrics/cvss:integrity-impact')
      .text
      .presence || 'undefined'
  end

  def availablility_impact(e)
    e.xpath('vuln:cvss/cvss:base_metrics/cvss:availablility-impact')
      .text
      .presence || 'undefined'
  end

  def confidentiality_impact(e)
    e.xpath('vuln:cvss/cvss:base_metrics/cvss:confidentiality-impact')
      .text
      .presence || 'undefined'
  end
end

