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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130620144012) do

  create_table "fixtures", :force => true do |t|
    t.string   "location"
    t.string   "hometeam"
    t.string   "awayteam"
    t.datetime "matchdate"
    t.boolean  "test"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "match"
    t.string   "city"
    t.string   "score"
  end

  create_table "matchpicks", :force => true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "type"
    t.string   "reason"
    t.string   "choose"
  end

  create_table "playerpicks", :force => true do |t|
    t.integer  "matchpick_id"
    t.string   "name"
    t.boolean  "selected"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "squad_id"
  end

  add_index "playerpicks", ["squad_id"], :name => "index_playerpicks_on_squad_id"

  create_table "predicts", :force => true do |t|
    t.integer  "fixture_id"
    t.integer  "user_id"
    t.integer  "homescore"
    t.integer  "awayscore"
    t.integer  "matchpick_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "scoreboards", :force => true do |t|
    t.integer  "fixture_id"
    t.integer  "user_id"
    t.integer  "matchscore"
    t.string   "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "squad_performances", :force => true do |t|
    t.integer  "fixture_id"
    t.integer  "squad_id"
    t.boolean  "play"
    t.integer  "tries"
    t.integer  "dropgoals"
    t.integer  "total"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "squad_perves", :force => true do |t|
    t.integer  "fixture_id"
    t.integer  "squad_id"
    t.boolean  "play"
    t.integer  "tries"
    t.integer  "dropgoals"
    t.integer  "total"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "squads", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "weight"
    t.integer  "height"
    t.string   "country"
    t.integer  "position"
    t.string   "position_strg"
    t.string   "group"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "test1"
    t.boolean  "test2"
    t.boolean  "test3"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.boolean  "admin"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

end
