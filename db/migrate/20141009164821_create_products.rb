class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :recipe_id

      t.timestamps
    end
  end
end
