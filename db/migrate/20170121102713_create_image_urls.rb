class CreateImageUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :image_urls do |t|
      t.integer :dictionary_id
      t.text :body

      t.timestamps
    end
  end
end
