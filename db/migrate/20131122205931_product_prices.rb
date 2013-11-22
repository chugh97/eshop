class ProductPrices < ActiveRecord::Migration
  def change
    create_table :product_prices do |t|
      t.integer :product_id
      t.decimal :price
      t.datetime :effective_start_date
    end
  end
end
