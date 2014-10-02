class CreateComandas < ActiveRecord::Migration
  def change
    create_table :comandas do |t|
      t.integer :articulo_id
      t.integer :order_id

      t.timestamps
    end
  end
end
