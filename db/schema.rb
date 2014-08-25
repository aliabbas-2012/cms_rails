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

ActiveRecord::Schema.define(version: 20140825053956) do

  create_table "pages", force: true do |t|
    t.integer  "subject_id"
    t.string   "name",       limit: 50,                null: false
    t.text     "body",                                 null: false
    t.integer  "position"
    t.string   "permalink",  limit: 50,                null: false
    t.boolean  "is_visible",            default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["permalink"], name: "index_pages_on_permalink", using: :btree
  add_index "pages", ["subject_id"], name: "index_pages_on_subject_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "name",       limit: 50,                null: false
    t.text     "body",                                 null: false
    t.integer  "position"
    t.string   "permalink",  limit: 50,                null: false
    t.boolean  "is_visible",            default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["permalink"], name: "index_posts_on_permalink", using: :btree

  create_table "sections", force: true do |t|
    t.integer  "page_id"
    t.string   "name",         limit: 50,                null: false
    t.string   "content_type", limit: 50,                null: false
    t.text     "content",                                null: false
    t.integer  "position"
    t.boolean  "is_visible",              default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["page_id"], name: "index_sections_on_page_id", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "name",        limit: 50,                 null: false
    t.text     "description"
    t.integer  "position"
    t.boolean  "is_visible",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name", limit: 25
    t.string   "last_name",  limit: 25
    t.string   "email",      limit: 25, default: "",     null: false
    t.string   "password",   limit: 40,                  null: false
    t.string   "gender",     limit: 10, default: "Male", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "sections", "pages", name: "fk_sections_page"

end
