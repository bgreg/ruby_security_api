class CreateExposures < ActiveRecord::Migration
  def change
    create_table :exposures do |t|
      t.string :cve_id
      t.text :summary
      t.text :published
      t.string :cvss_severity
      t.text :title
      t.integer :cvss_v2_base_score
      t.text :access_vector
      t.text :access_complexity
      t.text :authentication
      t.text :confidentiality_impact
      t.text :integrity_impact
      t.text :availablility_impact

      t.timestamps
    end
  end
end
