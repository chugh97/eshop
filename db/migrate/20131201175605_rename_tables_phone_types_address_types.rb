class RenameTablesPhoneTypesAddressTypes < ActiveRecord::Migration
  def change
    rename_table :phone_type, :phone_types
    rename_table :address_type, :address_types
  end
end
