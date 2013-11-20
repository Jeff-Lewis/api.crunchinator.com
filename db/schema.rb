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

ActiveRecord::Schema.define(version: 20131120204226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
    t.string   "crunchbase_url"
    t.string   "homepage_url"
    t.string   "blog_url"
    t.string   "blog_feed_url"
    t.string   "twitter_username"
    t.string   "category_code"
    t.integer  "number_of_employees"
    t.integer  "founded_year"
    t.integer  "founded_month"
    t.integer  "founded_day"
    t.integer  "deadpooled_year"
    t.integer  "deadpooled_month"
    t.integer  "deadpooled_url"
    t.string   "tag_list"
    t.string   "alias_list"
    t.string   "email_address"
    t.string   "phone_number"
    t.string   "description"
    t.text     "overview"
    t.string   "deadpooled_day"
  end

  create_table "people", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  add_index "people", ["permalink"], name: "index_people_on_permalink", using: :btree

end
