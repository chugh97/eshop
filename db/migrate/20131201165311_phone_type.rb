class PhoneType < ActiveRecord::Migration
  def change
    create_table :phone_type do |t|
      t.string :description
    end
  end
end
