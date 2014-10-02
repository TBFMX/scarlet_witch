class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :client_id
      t.timestamp :fecha_pedido
      t.string :tipo_pago
      t.string :tipo_entrega
      t.date :fecha_entrega
      t.integer :status

      t.timestamps
    end
  end
end
