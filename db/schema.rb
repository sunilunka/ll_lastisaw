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

ActiveRecord::Schema.define(version: 20140730202232) do

  create_table "artists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.date     "date"
    t.string   "city_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artist_id"
  end

  add_index "events", ["artist_id"], name: "index_events_on_artist_id"

  create_table "reviews", force: true do |t|
    t.string   "review"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.integer  "artist_id"
  end

  add_index "reviews", ["artist_id"], name: "index_reviews_on_artist_id"
  add_index "reviews", ["event_id"], name: "index_reviews_on_event_id"

end
