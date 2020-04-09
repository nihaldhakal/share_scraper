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

ActiveRecord::Schema.define(version: 2020_04_08_135321) do

  create_table "earnings_per_shares", force: :cascade do |t|
    t.string "quarter"
    t.float "value"
    t.date "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "share_id"
    t.index ["share_id"], name: "index_earnings_per_shares_on_share_id"
  end

  create_table "price_histories", force: :cascade do |t|
    t.date "date"
    t.float "ltp"
    t.float "change"
    t.float "high"
    t.float "low"
    t.float "open"
    t.integer "qty"
    t.float "turnover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "share_id"
    t.index ["share_id"], name: "index_price_histories_on_share_id"
  end

  create_table "shares", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.float "price_to_earning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_shares_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
