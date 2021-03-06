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

ActiveRecord::Schema.define(version: 20190819125957) do

  create_table "invheads", force: :cascade do |t|
    t.string "invoice_numb"
    t.string "order_numb"
    t.string "rel_numb"
    t.string "cust_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "order_date"
  end

  create_table "orderfroms", force: :cascade do |t|
    t.string "cust_code"
    t.string "cust_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "signed_invoices", force: :cascade do |t|
    t.string "invoice_numb"
    t.string "order_numb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
