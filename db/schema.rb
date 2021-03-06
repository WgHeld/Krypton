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

ActiveRecord::Schema.define(version: 20150228234913) do

  create_table "devices", force: :cascade do |t|
    t.string "name",        limit: 255, null: false
    t.string "reference",   limit: 255, null: false
    t.string "strategy",    limit: 255, null: false
    t.string "image",       limit: 255
    t.string "description", limit: 255
  end

  add_index "devices", ["reference"], name: "index_devices_on_reference", unique: true, using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "device_reference", limit: 255, null: false
    t.string   "type",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.string   "user_reference",   limit: 255
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "device_id",   limit: 4,                       null: false
    t.string   "state",       limit: 255, default: "running", null: false
    t.integer  "points",      limit: 4,   default: 0,         null: false
    t.datetime "started_at",                                  null: false
    t.datetime "finished_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name",      limit: 255, null: false
    t.string "reference", limit: 255, null: false
    t.string "image",     limit: 255
  end

  add_index "users", ["reference"], name: "index_users_on_reference", unique: true, using: :btree

end
