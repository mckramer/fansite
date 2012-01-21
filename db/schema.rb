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

ActiveRecord::Schema.define(:version => 20120118192805) do

  create_table "authentications", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["user_id"], :name => "index_authentications_on_user_id"

  create_table "blacklists", :force => true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blacklists", ["username"], :name => "index_blacklists_on_username", :unique => true

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "teaser"
    t.text     "description"
    t.string   "location"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "content_url"
    t.text     "captions"
    t.text     "analysis"
    t.date     "recorded_on"
    t.date     "released_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "media_provider_id"
    t.string   "source_url"
    t.string   "thumbnail_url"
    t.string   "provider_media_id"
    t.string   "form"
  end

  create_table "media_providers", :force => true do |t|
    t.string   "name"
    t.string   "source_url"
    t.string   "thumbnail_url"
    t.string   "content_url"
    t.string   "homepage_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "username"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "dob"
    t.datetime "last_login"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
