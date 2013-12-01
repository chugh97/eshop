class Phones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :phone_type_id
      t.string :phone_number
      t.integer :user_id
    end
  end
end
