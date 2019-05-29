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

ActiveRecord::Schema.define(version: 2019_05_29_061532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coffee_shops", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_coffee_shops_on_user_id"
  end

  create_table "feature_sets", force: :cascade do |t|
    t.integer "price"
    t.boolean "serves_plant_milk"
    t.boolean "serves_food"
    t.boolean "serves_smoothies"
    t.integer "plug_sockets"
    t.integer "busyness"
    t.integer "comfort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "coffee_shop_id"
    t.index ["coffee_shop_id"], name: "index_feature_sets_on_coffee_shop_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "coffee_shop_id"
    t.index ["coffee_shop_id"], name: "index_reviews_on_coffee_shop_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wifi_speeds", force: :cascade do |t|
    t.integer "upload_speed"
    t.integer "download_speed"
    t.integer "ping"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "feature_set_id"
    t.index ["feature_set_id"], name: "index_wifi_speeds_on_feature_set_id"
  end

  add_foreign_key "coffee_shops", "users"
  add_foreign_key "feature_sets", "coffee_shops"
  add_foreign_key "reviews", "coffee_shops"
  add_foreign_key "reviews", "users"
  add_foreign_key "wifi_speeds", "feature_sets"
end
