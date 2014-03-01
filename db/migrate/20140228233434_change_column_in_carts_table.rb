class ChangeColumnInCartsTable < ActiveRecord::Migration
  def change
    change_column :carts, :unit_price, :decimal, {:precision => 8, :scale =>2}
  end
end
