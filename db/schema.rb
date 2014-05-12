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

ActiveRecord::Schema.define(version: 20140508113738) do

  create_table "entries", force: true do |t|
    t.integer  "MerchantId"
    t.integer  "Amount"
    t.integer  "Order_Id"
    t.string   "Redirect_Url"
    t.integer  "WorkingKey"
    t.string   "billing_cust_name"
    t.string   "billing_cust_address"
    t.string   "billing_cust_state"
    t.string   "billing_cust_country"
    t.string   "billing_cust_tel"
    t.string   "billing_cust_email"
    t.string   "delivery_cust_name"
    t.string   "delivery_cust_address"
    t.string   "delivery_cust_state"
    t.string   "delivery_cust_country"
    t.string   "delivery_cust_tel"
    t.string   "delivery_cust_notes"
    t.string   "Merchant_Param"
    t.string   "billing_city"
    t.string   "billing_zip"
    t.string   "delivery_city"
    t.string   "delivery_zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
