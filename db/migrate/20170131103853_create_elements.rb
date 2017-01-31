class CreateElements < ActiveRecord::Migration[5.0]
  def change
    create_table :elements do |t|
      t.references :dictionary, polymorphic: true
      t.integer :step_id
      t.integer :place
      t.integer :image_url_id

      t.timestamps
    end
  end
end
