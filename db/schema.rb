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

ActiveRecord::Schema.define(version: 20140807205245) do

  create_table "appointments", force: true do |t|
    t.integer  "pet_id"
    t.integer  "walker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
  end

  create_table "behaviors", force: true do |t|
    t.boolean  "dog_aggro"
    t.boolean  "human_aggro"
    t.string   "bad_habits"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "households", force: true do |t|
    t.string   "owner_name"
    t.string   "address"
    t.string   "key_info"
    t.integer  "walker_id"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "email"
  end

  create_table "pets", force: true do |t|
    t.string   "species"
    t.string   "name"
    t.string   "avatar"
    t.string   "size"
    t.integer  "household_id"
    t.string   "allergies"
    t.integer  "vet_id"
    t.string   "age"
    t.string   "feeding"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "behavior_id"
    t.integer  "supply_id"
  end

  create_table "supplies", force: true do |t|
    t.string   "supply"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.boolean  "walker"
    t.string   "avatar"
    t.string   "name"
    t.string   "phone"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vets", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
