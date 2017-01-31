class CreateImageUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :image_urls do |t|
      t.references :dictionary, polymorphic: true
      t.string :body
      t.integer :element_id

      t.timestamps
    end
  end
end
