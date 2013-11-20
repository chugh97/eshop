class Order < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :session_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :unit_price

      t.timestamps
    end
  end
end
