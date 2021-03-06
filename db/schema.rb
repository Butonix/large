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

ActiveRecord::Schema.define(version: 20150417192443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "follows", force: :cascade do |t|
    t.integer  "followable_id"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "publication_edits", force: :cascade do |t|
    t.integer  "editor_id",  null: false
    t.integer  "pub_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "publication_edits", ["editor_id"], name: "index_publication_edits_on_editor_id", using: :btree
  add_index "publication_edits", ["pub_id"], name: "index_publication_edits_on_pub_id", using: :btree

  create_table "publication_writes", force: :cascade do |t|
    t.integer  "writer_id",  null: false
    t.integer  "pub_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "publication_writes", ["pub_id"], name: "index_publication_writes_on_pub_id", using: :btree
  add_index "publication_writes", ["writer_id"], name: "index_publication_writes_on_writer_id", using: :btree

  create_table "publications", force: :cascade do |t|
    t.integer  "owner_id",     null: false
    t.string   "title",        null: false
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "header_image"
    t.text     "icon_image"
    t.string   "header_align"
  end

  add_index "publications", ["owner_id"], name: "index_publications_on_owner_id", using: :btree

  create_table "stories", force: :cascade do |t|
    t.integer  "author_id",    null: false
    t.string   "pub_id"
    t.string   "title"
    t.string   "subtitle"
    t.text     "body"
    t.integer  "story_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "header_image"
  end

  add_index "stories", ["author_id"], name: "index_stories_on_author_id", using: :btree
  add_index "stories", ["pub_id"], name: "index_stories_on_pub_id", using: :btree
  add_index "stories", ["story_id"], name: "index_stories_on_story_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "taggable_id",   null: false
    t.integer  "tag_id",        null: false
    t.string   "taggable_type", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "label",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "description"
    t.text     "header_image"
    t.text     "icon_image"
  end

end
