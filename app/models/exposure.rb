class Exposure < ActiveRecord::Base
  validates :summary,                      presence: true, length: {minimum: 2}
  validates :cve_id,                       presence: true, length: {minimum: 2}
  validates :published,                    presence: true, length: {minimum: 2, maximum: 500}
  validates :title,                        presence: true, length: {minimum: 2, maximum: 500}
  validates :access_vector,                presence: true, length: {minimum: 2, maximum: 500}
  validates :access_complexity,            presence: true, length: {minimum: 2, maximum: 500}
  validates :authentication,               presence: true, length: {minimum: 2, maximum: 500}
  validates :impact_type,                  presence: true, length: {minimum: 2, maximum: 500}
  validates :external_source_link,         presence: true, length: {minimum: 2, maximum: 500}
  validates :external_source_name,         presence: true, length: {minimum: 2, maximum: 500}
  validates :external_source_organization, presence: true, length: {minimum: 2, maximum: 500}
  validates_numericality_of(:cvss_v2_base_score, :impact_subscore, :exploitability_subscore)
end
