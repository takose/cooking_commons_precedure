class CreateElements < ActiveRecord::Migration[5.0]
  def change
    create_table :elements do |t|
      t.integer :step_id
      t.integer :dictionary_id
      t.integer :place
      t.text :note

      t.timestamps
    end
  end
end
