class ExposureSerializer < ActiveModel::Serializer
  attributes :id,:cvss_severity, :summary, :cve_id, :published, :title, :access_vector, :access_complexity, :integrity_impact, :availablility_impact, :cvss_v2_base_score
  has_many :references
end
