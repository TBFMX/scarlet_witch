class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos do |t|
      t.string :title
      t.integer :tipo
      t.string :tiempo_preparacion
      t.string :descripcion

      t.timestamps
    end
  end
end
