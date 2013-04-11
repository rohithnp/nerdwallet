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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130409214916) do

  create_table "prices", :force => true do |t|
    t.date     "date"
    t.decimal  "open"
    t.decimal  "high"
    t.decimal  "low"
    t.integer  "volume"
    t.decimal  "lastClose"
    t.decimal  "last"
    t.decimal  "cummulativeCashDividend"
    t.integer  "cummulativeStockDividendRatio"
    t.decimal  "delay"
    t.integer  "security_id"
    t.decimal  "changeFromLastClose"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "securities", :force => true do |t|
    t.string   "name"
    t.string   "symbol"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
