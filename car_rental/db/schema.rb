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

ActiveRecord::Schema.define(version: 20150930024554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.decimal "rate",      precision: 8, scale: 2, null: false
    t.integer "garage_id",                         null: false
    t.string  "make",                              null: false
    t.string  "model",                             null: false
    t.integer "mileage",                           null: false
    t.integer "year",                              null: false
    t.string  "plate",                             null: false
  end

  add_index "cars", ["garage_id"], name: "index_cars_on_garage_id", using: :btree

  create_table "garages", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "address",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.integer  "renter_id",      null: false
    t.integer  "car_id"
    t.integer  "duration_hours"
    t.integer  "miles_driven"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "rentals", ["car_id"], name: "index_rentals_on_car_id", using: :btree

  create_table "renters", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "age",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
