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

ActiveRecord::Schema.define(version: 20171120164323) do

  create_table "authors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "browse_node_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_authors", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_item_authors_on_author_id"
    t.index ["item_id"], name: "index_item_authors_on_item_id"
  end

  create_table "item_categories", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_item_categories_on_category_id"
    t.index ["item_id"], name: "index_item_categories_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "title", null: false
    t.text "detail_page_url", null: false
    t.string "asin", null: false
    t.string "small_image"
    t.string "medium_image"
    t.string "large_image"
    t.date "publication_date", null: false
    t.text "introduction", null: false
    t.boolean "is_adult_content", default: false, null: false
    t.float "adult_score", null: false
    t.boolean "is_racy_content", default: false, null: false
    t.float "racy_score", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "label_id"
    t.date "free_last_date"
    t.index ["label_id"], name: "index_items_on_label_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
