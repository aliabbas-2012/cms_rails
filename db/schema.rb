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

ActiveRecord::Schema.define(version: 20141223072829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

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

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "categories"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "test_boot_straps", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 25
    t.string   "email",           limit: 25, default: "",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender",          limit: 10, default: "Male", null: false
    t.string   "password_digest"
    t.string   "username",        limit: 40
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "sections", "pages", name: "fk_sections_page"

end
