class CreateDictionaries < ActiveRecord::Migration[5.0]
  def change
    create_table :dictionaries do |t|
      t.string :category
      t.string :body

      t.timestamps
    end
  end
end
