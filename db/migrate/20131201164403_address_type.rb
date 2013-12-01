class AddressType < ActiveRecord::Migration
  def change
    create_table :address_type do |t|
      t.string :description
    end
  end
end
