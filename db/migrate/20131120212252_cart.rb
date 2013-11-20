class Cart < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :session_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :unit_price

      t.timestamps
    end
  end
end
