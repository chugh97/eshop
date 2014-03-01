class ChangePriceColumnPrecisionInProductPrice < ActiveRecord::Migration
  def change
    change_column :product_prices, :price, :decimal, {:precision => 10, :scale =>2}
  end
end
