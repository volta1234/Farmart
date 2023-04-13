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

ActiveRecord::Schema[7.0].define(version: 2023_04_13_220611) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.bigint "farmer_id", null: false
    t.string "animal_type"
    t.string "breed"
    t.integer "age"
    t.float "price"
    t.boolean "in_stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farmer_id"], name: "index_animals_on_farmer_id"
  end

  create_table "farmers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "farmer_name"
    t.string "farmer_location"
    t.integer "contact_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_farmers_on_user_id"
  end

  create_table "lands", force: :cascade do |t|
    t.bigint "farmer_id", null: false
    t.float "price"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farmer_id"], name: "index_lands_on_farmer_id"
  end

  create_table "leases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "land_id", null: false
    t.boolean "lease_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["land_id"], name: "index_leases_on_land_id"
    t.index ["user_id"], name: "index_leases_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "animal_id", null: false
    t.float "total_price"
    t.boolean "order_status"
    t.string "delivery_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_orders_on_animal_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "animals", "farmers"
  add_foreign_key "farmers", "users"
  add_foreign_key "lands", "farmers"
  add_foreign_key "leases", "lands"
  add_foreign_key "leases", "users"
  add_foreign_key "orders", "animals"
  add_foreign_key "orders", "users"
end
