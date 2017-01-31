class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.integer :recipe_id
      t.string :note

      t.timestamps
    end
  end
end
