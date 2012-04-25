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

ActiveRecord::Schema.define(:version => 20120425065650) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "wines", :force => true do |t|
    t.integer  "nummer"
    t.integer  "artikelID"
    t.integer  "varnummer"
    t.string   "namn"
    t.float    "pris"
    t.float    "volym"
    t.float    "ppl"
    t.string   "varugrupp"
    t.string   "forpackning"
    t.string   "land"
    t.string   "producent"
    t.integer  "ar"
    t.string   "alkoholhalt"
    t.integer  "ekologisk"
    t.integer  "koscher"
    t.string   "ravaror"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
