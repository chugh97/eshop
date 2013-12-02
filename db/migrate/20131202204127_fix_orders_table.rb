class FixOrdersTable < ActiveRecord::Migration
  def change
    remove_column :orders, :product_id
    remove_column :orders, :quantity
    remove_column :orders, :unit_price
    add_column :orders, :order_number, :string
    add_column :carts, :purchased_at, :datetime
  end
end
