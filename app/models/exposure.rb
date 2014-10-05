class Exposure < ActiveRecord::Base

  #----------------------------------------------------------------------------
  # Relations
  #----------------------------------------------------------------------------
  has_many :references

  #----------------------------------------------------------------------------
  # Validations
  #----------------------------------------------------------------------------
  validates :summary,                presence: true, length: {minimum: 2}
  validates :published,              presence: true, length: {minimum: 2, maximum: 500}
  validates :title,                  presence: true, length: {minimum: 2, maximum: 500}
  validates :access_vector,          presence: true, length: {minimum: 2, maximum: 500}
  validates :access_complexity,      presence: true, length: {minimum: 2, maximum: 500}
  validates :authentication,         presence: true, length: {minimum: 2, maximum: 500}
  validates :confidentiality_impact, presence: true
  validates :integrity_impact,       presence: true
  validates :availablility_impact,   presence: true
  validates :cve_id,                 uniqueness: true, presence: true, length: {minimum: 2}
  validates_numericality_of :cvss_v2_base_score

  #----------------------------------------------------------------------------
  # Scopes
  #----------------------------------------------------------------------------
  scope :ruby_true, lambda { where(ruby: true) }
  scope :recent,    lambda {
    where(ruby: true, published: (Date.today.midnight .. 30.days.ago)) }

end
