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

ActiveRecord::Schema.define(version: 20180110090207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_items", force: :cascade do |t|
    t.bigint "equipment_id"
    t.bigint "booking_id"
    t.integer "booking_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_items_on_booking_id"
    t.index ["equipment_id"], name: "index_booking_items_on_equipment_id"
  end

  create_table "booking_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.bigint "booking_status_id"
    t.date "pickup_date"
    t.date "return_date"
    t.uuid "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "message"
    t.integer "position"
    t.index ["booking_status_id"], name: "index_bookings_on_booking_status_id"
    t.index ["project_id"], name: "index_bookings_on_project_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.string "inv_nr"
    t.text "description"
    t.integer "quantity", default: 1
    t.text "thumb_image"
    t.text "main_image"
    t.bigint "category_id"
    t.bigint "equipment_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_equipment_on_category_id"
    t.index ["equipment_status_id"], name: "index_equipment_on_equipment_status_id"
  end

  create_table "equipment_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "thumb_image"
    t.text "main_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles"
    t.text "street"
    t.integer "postal_code"
    t.string "city"
    t.integer "matriculation_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "booking_items", "bookings"
  add_foreign_key "booking_items", "equipment"
  add_foreign_key "bookings", "booking_statuses"
  add_foreign_key "bookings", "projects"
  add_foreign_key "bookings", "users"
  add_foreign_key "equipment", "categories"
  add_foreign_key "equipment", "equipment_statuses"
end
