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

ActiveRecord::Schema.define(version: 20180129011313) do

  create_table "assorts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.string "comment"
    t.datetime "time_cmt"
    t.integer "reply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id", "created_at"], name: "index_comments_on_product_id_and_created_at"
    t.index ["product_id"], name: "index_comments_on_product_id"
    t.index ["user_id", "created_at"], name: "index_comments_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.integer "id_child"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.integer "typenew_id"
    t.string "title"
    t.string "description"
    t.string "img_thumb"
    t.text "content"
    t.datetime "day_create"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["typenew_id", "created_at"], name: "index_news_on_typenew_id_and_created_at"
    t.index ["typenew_id"], name: "index_news_on_typenew_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "quantity"
    t.float "price_detail"
    t.float "price_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id", "created_at"], name: "index_order_details_on_order_id_and_created_at"
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id", "created_at"], name: "index_order_details_on_product_id_and_created_at"
    t.index ["product_id"], name: "index_order_details_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.string "oder_code"
    t.datetime "date_purchase"
    t.string "content"
    t.string "adress"
    t.float "price"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_orders_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "trademark_id"
    t.integer "assort_id"
    t.string "name"
    t.string "img_detail"
    t.text "content"
    t.float "price"
    t.integer "status"
    t.string "keys"
    t.float "star"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assort_id", "created_at"], name: "index_products_on_assort_id_and_created_at"
    t.index ["assort_id"], name: "index_products_on_assort_id"
    t.index ["trademark_id", "created_at"], name: "index_products_on_trademark_id_and_created_at"
    t.index ["trademark_id"], name: "index_products_on_trademark_id"
  end

  create_table "rates", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.integer "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id", "created_at"], name: "index_rates_on_product_id_and_created_at"
    t.index ["product_id"], name: "index_rates_on_product_id"
    t.index ["user_id", "created_at"], name: "index_rates_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_rates_on_user_id"
  end

  create_table "trademarks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "typenews", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
