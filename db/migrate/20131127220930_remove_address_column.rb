class RemoveAddressColumn < ActiveRecord::Migration
  def change
    remove_column :users, :address
    add_column :users, :last_name, :string
    add_column :users, :email, :string
  end
end
