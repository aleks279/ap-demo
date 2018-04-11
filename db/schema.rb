# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20180411221623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "page_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "page_category_id"
  end

  add_index "pages", ["page_category_id"], name: "index_pages_on_page_category_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "page_id"
  end

  add_index "sections", ["page_id"], name: "index_sections_on_page_id", using: :btree

  add_foreign_key "pages", "page_categories"
  add_foreign_key "sections", "pages"
end
