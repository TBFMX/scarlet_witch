class CreateHistorialDeCompras < ActiveRecord::Migration
  def change
    create_table :historial_de_compras do |t|
      t.string :nombre_generico
      t.string :description
      t.string :cantidad
      t.string :unidad
      t.string :precio
      t.string :multiplicador
      t.integer :subcategory_id
      t.integer :category_id
      t.string :origen
      t.timestamps
    end
  end
end
