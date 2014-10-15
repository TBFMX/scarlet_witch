class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :nombre
      t.string :unidad
      t.string :yield

      t.timestamps
    end
  end
end
