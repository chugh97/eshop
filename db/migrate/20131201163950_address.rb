class Address < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :address_type_id
      t.string :line_1
      t.string :line_2
      t.string :town
      t.string :postcode
      t.string :country
      t.integer :user_id
    end
  end
end
