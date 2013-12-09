# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131209231704) do

  create_table "address_types", force: true do |t|
    t.string "description"
  end

  create_table "addresses", force: true do |t|
    t.integer "address_type_id"
    t.string  "line_1"
    t.string  "line_2"
    t.string  "town"
    t.string  "postcode"
    t.string  "country"
    t.integer "user_id"
  end

  create_table "carts", force: true do |t|
    t.string   "session_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "unit_price",   precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "purchased_at"
  end

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "invitations", force: true do |t|
    t.string   "invite_code"
    t.datetime "issued_at"
    t.string   "email"
  end

  create_table "order_transactions", force: true do |t|
    t.integer  "order_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.string   "session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "order_number"
    t.string   "express_token"
    t.string   "express_payer_id"
  end

  create_table "phone_types", force: true do |t|
    t.string "description"
  end

  create_table "phones", force: true do |t|
    t.integer "phone_type_id"
    t.string  "phone_number"
    t.integer "user_id"
  end

  create_table "product_prices", force: true do |t|
    t.integer  "product_id"
    t.decimal  "price",                precision: 10, scale: 0
    t.datetime "effective_start_date"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string  "name"
    t.string  "last_name"
    t.string  "email"
    t.boolean "is_confirmed"
    t.string  "encrypted_password"
  end

end
