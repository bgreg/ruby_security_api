class CreateExposures < ActiveRecord::Migration
  def change
    create_table :exposures do |t|
      t.string :cve_id
      t.text :summary
      t.text :published
      t.string :cvss_severity
      t.text :title
      t.integer :cvss_v2_base_score
      t.integer :impact_subscore
      t.integer :exploitability_subscore
      t.text :access_vector
      t.text :access_complexity
      t.text :authentication
      t.text :impact_type
      t.text :external_source_organization
      t.text :external_source_name
      t.text :external_source_link

      t.timestamps
    end
  end
end
