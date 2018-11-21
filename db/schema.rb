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

ActiveRecord::Schema.define(version: 2018_11_21_172953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auctions", force: :cascade do |t|
    t.date "in_date"
    t.float "amount"
    t.float "bid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "out_date"
    t.integer "residence_id"
  end

  create_table "residences", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "address"
    t.integer "capacity"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residencia", force: :cascade do |t|
    t.string "nombre"
    t.string "pais"
    t.string "direccion"
    t.integer "capacidad"
    t.string "foto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "fecha"
  end

  create_table "tiempo_compartidos", force: :cascade do |t|
    t.string "nombre"
    t.string "pais"
    t.string "direccion"
    t.integer "capacidad"
    t.string "foto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
