class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
