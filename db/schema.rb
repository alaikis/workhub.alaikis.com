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

ActiveRecord::Schema[7.1].define(version: 2024_04_04_235949) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.text "first_name"
    t.text "last_name"
    t.text "email"
    t.string "tel"
    t.string "country_code"
    t.string "province"
    t.string "province_code"
    t.string "city"
    t.string "suburbs"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "zipcode"
    t.boolean "primary", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authorizes", force: :cascade do |t|
    t.string "name"
    t.string "grant_id"
    t.string "locale"
    t.string "grant_type"
    t.json "meta", default: "{}"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "manufacturer_id"
    t.text "icon"
    t.text "web_site"
    t.text "brief"
    t.boolean "state", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catalog_types", force: :cascade do |t|
    t.string "name"
    t.text "brief"
    t.string "code"
    t.string "bind_resource"
    t.json "ext", default: "{}"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "keywords"
    t.text "meta_description"
    t.text "remark"
    t.string "catalog_types_id"
    t.boolean "state", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catalog_types_id"], name: "index_categories_on_catalog_types_id"
  end

  create_table "declares", force: :cascade do |t|
    t.text "name"
    t.text "name_locale"
    t.string "item_id"
    t.string "hs_code"
    t.string "route_type", default: "country"
    t.decimal "weight", precision: 10, scale: 3, null: false
    t.decimal "length", precision: 10, scale: 3, null: false
    t.decimal "width", precision: 10, scale: 3, null: false
    t.decimal "height", precision: 10, scale: 3, null: false
    t.string "weight_unit", default: "g", null: false
    t.string "length_unit", default: "cm", null: false
    t.string "declare_currency", default: "USD"
    t.decimal "declare_value", precision: 10, scale: 2, null: false
    t.string "certificate_id"
    t.string "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_primary_key"
    t.text "attributes"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.text "title", null: false
    t.string "catalog_id"
    t.string "shop_id"
    t.string "brand_id"
    t.string "item_type_id"
    t.json "images_mapping", default: "{}"
    t.text "videos"
    t.integer "mqq", default: 1, null: false
    t.string "locale", default: "en-us", null: false
    t.string "currency", default: "USD", null: false
    t.string "country", default: "US", null: false
    t.string "language", default: "en", null: false
    t.string "mpn", null: false
    t.string "gtin"
    t.string "shop_sku", null: false
    t.text "height_lings"
    t.text "description"
    t.boolean "state", default: true
    t.json "attributes", default: "{}"
    t.json "meta", default: "{}"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["catalog_id"], name: "index_items_on_catalog_id"
    t.index ["item_type_id"], name: "index_items_on_item_type_id"
    t.index ["shop_id"], name: "index_items_on_shop_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.text "icon"
    t.text "web_site"
    t.text "brief"
    t.string "telephone"
    t.string "comm_type"
    t.string "comm_account"
    t.text "remark"
    t.boolean "state", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_fee_lines", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "name"
    t.string "code"
    t.string "currency", default: "USD"
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.boolean "state", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_fee_lines_on_order_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "{:null=>false, :foreign_key=>{:to_table=>:orders}}_id"
    t.bigint "item_id"
    t.bigint "{:null=>false, :foreign_key=>{:to_table=>:variants}}_id"
    t.bigint "declare_id"
    t.bigint "{:null=>false, :foreign_key=>{:to_table=>:declares}}_id"
    t.text "shop_order_line_id"
    t.integer "quantity", default: 1
    t.decimal "snap_sale_price", precision: 10, scale: 2
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["declare_id"], name: "index_order_items_on_declare_id"
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["{:null=>false, :foreign_key=>{:to_table=>:declares}}_id"], name: "idx_on_{:null=>false, :foreign_key=>{:to_table=>:de_dcb6b6735e"
    t.index ["{:null=>false, :foreign_key=>{:to_table=>:orders}}_id"], name: "idx_on_{:null=>false, :foreign_key=>{:to_table=>:or_962dd2b41d"
    t.index ["{:null=>false, :foreign_key=>{:to_table=>:variants}}_id"], name: "idx_on_{:null=>false, :foreign_key=>{:to_table=>:va_14d6667a04"
  end

  create_table "order_packages", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "name"
    t.string "carrier_id"
    t.text "tracking_number"
    t.text "exchange_number"
    t.text "label"
    t.decimal "length", precision: 10, scale: 3, null: false
    t.decimal "width", precision: 10, scale: 3, null: false
    t.decimal "height", precision: 10, scale: 3, null: false
    t.string "length_unit", default: "cm", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_packages_on_order_id"
  end

  create_table "order_packages_items", force: :cascade do |t|
    t.bigint "pkg_id", null: false
    t.bigint "item_id", null: false
    t.integer "quantity", null: false
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_order_packages_items_on_item_id"
    t.index ["pkg_id"], name: "index_order_packages_items_on_pkg_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_number"
    t.string "shop_order_number"
    t.string "carrier_standard"
    t.string "payment_method"
    t.string "shop_id"
    t.string "shipping_address_id"
    t.string "billing_address_id"
    t.string "transaction_id"
    t.integer "progress", default: 0, null: false
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["billing_address_id"], name: "index_orders_on_billing_address_id"
    t.index ["shipping_address_id"], name: "index_orders_on_shipping_address_id"
    t.index ["shop_id"], name: "index_orders_on_shop_id"
    t.index ["transaction_id"], name: "index_orders_on_transaction_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "name"
    t.string "usage"
    t.string "space"
    t.text "value"
    t.boolean "json_object", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_fee_lines", force: :cascade do |t|
    t.string "billing_id"
    t.string "origin_line_id"
    t.text "remark"
    t.integer "quantity", default: 1
    t.decimal "value", precision: 10, scale: 2
    t.boolean "effect", default: false
    t.string "currency", default: "USD", null: false
    t.string "actual_currency", default: "USD", null: false
    t.decimal "actual_value", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "subject"
    t.string "channel_id"
    t.string "biz_number"
    t.string "transaction_id"
    t.string "accountant_id"
    t.string "caption_id"
    t.string "billing_address_id"
    t.text "proof"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "variants", force: :cascade do |t|
    t.bigint "item_id"
    t.json "attribute", default: "{}"
    t.string "sku", null: false
    t.string "barcode"
    t.string "image"
    t.string "shop_sku", null: false
    t.string "gtin"
    t.decimal "weight", precision: 10, scale: 3, null: false
    t.decimal "length", precision: 10, scale: 3, null: false
    t.decimal "width", precision: 10, scale: 3, null: false
    t.decimal "height", precision: 10, scale: 3, null: false
    t.string "weight_unit", default: "g", null: false
    t.string "length_unit", default: "cm", null: false
    t.decimal "suggest_price", precision: 10, scale: 2
    t.decimal "sale_price", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_variants_on_item_id"
  end

  add_foreign_key "order_fee_lines", "orders"
  add_foreign_key "order_packages", "orders"
  add_foreign_key "order_packages_items", "order_items", column: "item_id"
  add_foreign_key "order_packages_items", "order_packages", column: "pkg_id"
end
