class CreateArtworkParts < ActiveRecord::Migration[6.0]
  def change
    create_table :artwork_parts do |t|
      t.string :text
      t.references :artwork, null: false, foreign_key: true

      t.timestamps
    end
  end
end
