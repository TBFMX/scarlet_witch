class CreateSubrecipes < ActiveRecord::Migration
  def change
    create_table :subrecipes do |t|
      t.integer :recipe_id
      t.integer :subrecipe_id

      t.timestamps
    end
  end
end
