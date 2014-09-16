class Exposure < ActiveRecord::Base
  has_many :references

  validates :summary,                      presence: true, length: {minimum: 2}
  validates :cve_id,                       presence: true, length: {minimum: 2}
  validates :published,                    presence: true, length: {minimum: 2, maximum: 500}
  validates :title,                        presence: true, length: {minimum: 2, maximum: 500}
  validates :access_vector,                presence: true, length: {minimum: 2, maximum: 500}
  validates :access_complexity,            presence: true, length: {minimum: 2, maximum: 500}
  validates :authentication,               presence: true, length: {minimum: 2, maximum: 500}
  validates :confidentiality_impact,       presence: true
  validates :integrity_impact,             presence: true
  validates :availablility_impact,         presence: true
  validates_numericality_of(:cvss_v2_base_score)
end
