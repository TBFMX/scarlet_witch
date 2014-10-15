class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :nombre
      t.string :unidad
      t.integer :consumible
      t.integer :disponibles

      t.timestamps
    end
  end
end
