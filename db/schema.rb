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

ActiveRecord::Schema.define(version: 2022_06_01_023909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.float "price"
    t.integer "quantity"
    t.string "status"
    t.bigint "products_id"
    t.bigint "orders_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["orders_id"], name: "index_order_details_on_orders_id"
    t.index ["products_id"], name: "index_order_details_on_products_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id"
    t.index ["users_id"], name: "index_orders_on_users_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "price"
    t.integer "size"
    t.string "color"
    t.string "description"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "categories_id"
    t.index ["categories_id"], name: "index_products_on_categories_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "password"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "order_details", "orders", column: "orders_id"
  add_foreign_key "order_details", "products", column: "products_id"
  add_foreign_key "orders", "users", column: "users_id"
  add_foreign_key "products", "categories", column: "categories_id"
end
