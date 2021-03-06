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

ActiveRecord::Schema.define(version: 20130710074843) do

  create_table "comments", force: true do |t|
    t.integer  "comment_id", default: -1
    t.integer  "commenter"
    t.integer  "weibo_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "find_passwords", force: true do |t|
    t.string   "email",      limit: 50
    t.string   "code",       limit: 40
    t.datetime "last_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "t_values", force: true do |t|
    t.string   "heads"
    t.string   "items"
    t.integer  "theader_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "t_values", ["theader_id"], name: "index_t_values_on_theader_id"

  create_table "theaders", force: true do |t|
    t.integer  "user_id"
    t.integer  "direction",  default: 0
    t.string   "title"
    t.string   "_title"
    t.string   "heads"
    t.string   "items"
    t.string   "intro"
    t.integer  "ttype",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_configs", force: true do |t|
    t.integer  "user_id"
    t.string   "usernames"
    t.string   "friends"
    t.string   "configs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "passport"
    t.string   "dname",      limit: 20
    t.string   "password",   limit: 16
    t.string   "config"
    t.string   "email",      limit: 40, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weibos", force: true do |t|
    t.integer  "user_id",      default: 1,  null: false
    t.string   "body",                      null: false
    t.integer  "weibo_id",     default: -1
    t.integer  "btype",        default: 0
    t.integer  "thumbs_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
