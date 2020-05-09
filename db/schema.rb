# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_09_164250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cover_photos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "venue_id"
    t.index ["venue_id"], name: "index_cover_photos_on_venue_id"
  end

  create_table "opening_hours", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "day"
    t.time "open"
    t.time "close"
    t.bigint "venue_id"
    t.index ["venue_id"], name: "index_opening_hours_on_venue_id"
  end

  create_table "review_photos", force: :cascade do |t|
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "review_id"
    t.index ["review_id"], name: "index_review_photos_on_review_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "venue_id"
    t.float "quietness"
    t.float "comfort"
    t.float "plug_sockets"
    t.float "upload_speed"
    t.float "download_speed"
    t.float "ping"
    t.boolean "serves_food"
    t.boolean "air_conditioning"
    t.boolean "has_wifi"
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["venue_id"], name: "index_reviews_on_venue_id"
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

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.float "rating"
    t.float "upload_speed"
    t.float "download_speed"
    t.float "ping"
    t.integer "price"
    t.boolean "serves_food"
    t.float "plug_sockets"
    t.float "quietness"
    t.float "comfort"
    t.boolean "air_conditioning"
    t.integer "wifi_restrictions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.float "latitude"
    t.float "longitude"
    t.string "foursquare_id"
    t.boolean "has_wifi"
    t.string "category"
    t.bigint "owner_id"
    t.index ["latitude", "longitude"], name: "index_venues_on_latitude_and_longitude"
    t.index ["owner_id"], name: "index_venues_on_owner_id"
    t.index ["user_id"], name: "index_venues_on_user_id"
  end

  add_foreign_key "cover_photos", "venues"
  add_foreign_key "opening_hours", "venues"
  add_foreign_key "review_photos", "reviews"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "venues"
  add_foreign_key "venues", "users"
  add_foreign_key "venues", "users", column: "owner_id"
end
