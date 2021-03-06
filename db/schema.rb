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

ActiveRecord::Schema.define(version: 20160710154652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clothings", force: :cascade do |t|
    t.string   "description"
    t.string   "title"
    t.string   "type"
    t.string   "size"
    t.string   "length"
    t.string   "material"
    t.string   "height"
    t.string   "color"
    t.integer  "cost"
    t.string   "sleeve_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "times_worn"
    t.integer  "designer_id"
  end

  create_table "designers", force: :cascade do |t|
    t.string   "name"
    t.string   "website_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "outfits", force: :cascade do |t|
    t.string   "description"
    t.integer  "clothing_top_id"
    t.integer  "clothing_bottom_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "description"
    t.integer  "clothing_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.integer  "x"
    t.integer  "y"
  end

  add_index "photos", ["clothing_id"], name: "index_photos_on_clothing_id", using: :btree

  create_table "seasons", force: :cascade do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "outfit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "seasons", ["outfit_id"], name: "index_seasons_on_outfit_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "clothing_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "taggings", ["clothing_id"], name: "index_taggings_on_clothing_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "photos", "clothings"
  add_foreign_key "seasons", "outfits"
  add_foreign_key "taggings", "clothings"
  add_foreign_key "taggings", "tags"
end
