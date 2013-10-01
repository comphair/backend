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

ActiveRecord::Schema.define(version: 20131001123708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.integer "store_id",                 null: false
    t.string  "first_name",               null: false
    t.string  "last_name",                null: false
    t.string  "street",                   null: false
    t.string  "zipcode",                  null: false
    t.string  "city",                     null: false
    t.string  "country",                  null: false
    t.float   "latitude",   default: 0.0, null: false
    t.float   "longitude",  default: 0.0, null: false
  end

  create_table "appointments", force: true do |t|
    t.integer "timeslot_id",   null: false
    t.integer "haircut_id",    null: false
    t.integer "customer_id",   null: false
    t.integer "start_minutes", null: false
    t.text    "comment"
  end

  create_table "customers", force: true do |t|
    t.string "name", null: false
  end

  create_table "haircuts", force: true do |t|
    t.integer "store_id",               null: false
    t.decimal "price",    default: 0.0, null: false
    t.integer "duration", default: 0,   null: false
  end

  create_table "placekeepers", force: true do |t|
    t.integer "timeslot_id",   null: false
    t.integer "haircut_id",    null: false
    t.string  "session_key",   null: false
    t.integer "start_minutes", null: false
  end

  create_table "schedules", force: true do |t|
    t.integer "store_id", null: false
  end

  create_table "stores", force: true do |t|
    t.string "title",                     null: false
    t.float  "rating",      default: 0.0, null: false
    t.text   "description",               null: false
  end

  create_table "timeslots", force: true do |t|
    t.integer "schedule_id",   null: false
    t.date    "date",          null: false
    t.integer "start_minutes", null: false
  end

end
