class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.text :source
      t.text :url
      t.belongs_to :exposure

      t.timestamps
    end
  end
end
