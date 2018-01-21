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

ActiveRecord::Schema.define(version: 20180121182914) do

  create_table "authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hided", default: false, null: false
  end

  create_table "bookshelf_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "bookshelf_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bookshelf_id"], name: "index_bookshelf_items_on_bookshelf_id"
    t.index ["item_id"], name: "index_bookshelf_items_on_item_id"
  end

  create_table "bookshelves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "uuid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "browse_node_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hided", default: false, null: false
  end

  create_table "footer_ads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.text "dom_pc", null: false
    t.text "dom_sp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "item_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_item_authors_on_author_id"
    t.index ["item_id"], name: "index_item_authors_on_item_id"
  end

  create_table "item_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "item_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_item_categories_on_category_id"
    t.index ["item_id"], name: "index_item_categories_on_item_id"
  end

  create_table "item_series", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "item_id", null: false
    t.bigint "series_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_series_on_item_id"
    t.index ["series_id"], name: "index_item_series_on_series_id"
  end

  create_table "item_tweets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "item_id", null: false
    t.integer "tweet_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_tweets_on_item_id"
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", null: false
    t.text "detail_page_url", null: false
    t.string "asin", null: false
    t.string "small_image"
    t.string "medium_image"
    t.string "large_image"
    t.date "publication_date", null: false
    t.text "introduction", null: false
    t.boolean "is_adult_content", default: false, null: false
    t.float "adult_score", limit: 24, null: false
    t.boolean "is_racy_content", default: false, null: false
    t.float "racy_score", limit: 24, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "label_id"
    t.date "free_last_date"
    t.boolean "is_magazine", default: false, null: false
    t.boolean "is_novel", default: false, null: false
    t.integer "cute_count", default: 0, null: false
    t.integer "cool_count", default: 0, null: false
    t.integer "funny_count", default: 0, null: false
    t.integer "horror_count", default: 0, null: false
    t.string "isbn10"
    t.string "rakuten_url"
    t.index ["label_id"], name: "index_items_on_label_id"
  end

  create_table "labels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hided", default: false, null: false
  end

  create_table "series", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hided", default: false, null: false
  end

  add_foreign_key "bookshelf_items", "bookshelves"
  add_foreign_key "bookshelf_items", "items"
  add_foreign_key "item_authors", "authors"
  add_foreign_key "item_authors", "items"
  add_foreign_key "item_categories", "categories"
  add_foreign_key "item_categories", "items"
  add_foreign_key "item_series", "items"
  add_foreign_key "item_series", "series"
  add_foreign_key "item_tweets", "items"
  add_foreign_key "items", "labels"
end
