ActiveRecord::Schema.define(version: 2022_09_06_111456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "day_menu_dishes", force: :cascade do |t|
    t.float "day_price"
    t.bigint "day_menu_id", null: false
    t.bigint "dish_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_menu_id"], name: "index_day_menu_dishes_on_day_menu_id"
    t.index ["dish_id"], name: "index_day_menu_dishes_on_dish_id"
  end

  create_table "day_menus", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.integer "units"
    t.float "dish_price"
    t.bigint "category_id", null: false
    t.bigint "measure_id", null: false
    t.bigint "pricing_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_dishes_on_category_id"
    t.index ["measure_id"], name: "index_dishes_on_measure_id"
    t.index ["pricing_type_id"], name: "index_dishes_on_pricing_type_id"
  end

  create_table "measures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "number_of_servings"
    t.float "price"
    t.bigint "order_id", null: false
    t.bigint "day_menu_dish_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_menu_dish_id"], name: "index_order_items_on_day_menu_dish_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.float "total_price"
    t.bigint "day_menu_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_menu_id"], name: "index_orders_on_day_menu_id"
  end

  create_table "pricing_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "day_menu_dishes", "day_menus"
  add_foreign_key "day_menu_dishes", "dishes"
  add_foreign_key "dishes", "categories"
  add_foreign_key "dishes", "measures"
  add_foreign_key "dishes", "pricing_types"
  add_foreign_key "order_items", "day_menu_dishes"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "day_menus"
end
