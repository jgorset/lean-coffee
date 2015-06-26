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

ActiveRecord::Schema.define(version: 20150626152902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rooms", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.string   "slug",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "rooms", ["slug"], name: "index_rooms_on_slug", unique: true, using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "status"
    t.integer  "votes",      default: 0, null: false
    t.integer  "room_id"
  end

  add_index "topics", ["room_id"], name: "index_topics_on_room_id", using: :btree

  add_foreign_key "topics", "rooms"
end
