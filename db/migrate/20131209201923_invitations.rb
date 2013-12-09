class Invitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :invite_code
      t.datetime :issued_at
      t.string :email
    end
  end
end
