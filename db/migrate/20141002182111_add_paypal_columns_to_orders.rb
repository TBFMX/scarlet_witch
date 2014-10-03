class AddPaypalColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment_id, :string
    add_column :orders, :state, :string
    add_column :orders, :amount, :string
  end
end
