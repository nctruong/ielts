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

ActiveRecord::Schema.define(version: 20160813085620) do

  create_table "oauths", force: :cascade do |t|
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "name",             limit: 255
    t.string   "oauth_token",      limit: 255
    t.string   "oauth_expires_at", limit: 255
    t.integer  "student_id",       limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "username",      limit: 255
    t.string   "password",      limit: 255
    t.string   "sex",           limit: 255
    t.string   "phone",         limit: 255
    t.string   "email",         limit: 255
    t.string   "avatar",        limit: 255
    t.datetime "joined_date"
    t.integer  "student_level", limit: 4
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.datetime "birthday"
    t.string   "country",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "name",             limit: 255
    t.datetime "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end