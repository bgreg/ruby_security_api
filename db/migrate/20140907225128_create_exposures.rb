class CreateExposures < ActiveRecord::Migration
  def change
    create_table :exposures do |t|
      t.string :summary
      t.string :published
      t.integer :cvss_severity
      t.string :title
      t.integer :cvss_v2_base_score
      t.integer :impact_subscore
      t.integer :exploitability_subscore
      t.string :access_vector
      t.string :access_complexity
      t.string :authentication
      t.string :impact_type
      t.string :web_link
      t.string :external_source_organization
      t.string :external_source_name
      t.string :external_source_link

      t.timestamps
    end
  end
end