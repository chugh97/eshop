class User < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :address
    end
  end
end
