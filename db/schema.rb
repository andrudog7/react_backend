# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_10_204214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.bigint "user_id"
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_comments_on_restaurant_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "price"
    t.string "address1"
    t.string "state"
    t.string "zip_code"
    t.integer "rating"
    t.string "image_url"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "image", default: "https://icon-library.net//images/no-user-image-icon/no-user-image-icon-27.jpg"
    t.string "password_digest"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users_restaurants", force: :cascade do |t|
    t.integer "user_id"
    t.integer "restaurant_id"
    t.boolean "top_four"
    t.boolean "outdoor_seating"
    t.boolean "reservations"
    t.boolean "bottomless"
    t.string "bottomless_price"
    t.string "time_limit"
    t.string "attribute1"
    t.string "attribute2"
    t.string "attribute3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "comment_id", null: false
    t.bigint "user_id", null: false
    t.boolean "up"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_votes_on_comment_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "votes", "comments"
  add_foreign_key "votes", "users"
end
