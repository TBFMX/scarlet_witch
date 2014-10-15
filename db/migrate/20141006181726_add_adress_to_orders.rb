class AddAdressToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :calle, :string
    add_column :orders, :colonia, :string
    add_column :orders, :ciudad, :string
    add_column :orders, :cp, :string
    add_column :orders, :estado, :string
  end
end
