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

ActiveRecord::Schema.define(version: 2019_06_20_150528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer "messenger"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "callbacks", force: :cascade do |t|
    t.bigint "account_id"
    t.integer "event"
    t.datetime "timestamp"
    t.string "message_token"
    t.boolean "handled", default: false
    t.json "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_callbacks_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "account_id"
    t.string "external_id"
    t.string "name"
    t.string "avatar"
    t.string "country"
    t.string "language"
    t.string "api_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "subscribed", default: false
    t.index ["account_id"], name: "index_users_on_account_id"
  end

  add_foreign_key "callbacks", "accounts"
  add_foreign_key "users", "accounts"
end
