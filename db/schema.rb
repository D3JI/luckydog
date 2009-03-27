# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090326092405) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.integer  "role_id"
    t.boolean  "enable",          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "albums", :force => true do |t|
    t.integer  "space_id"
    t.string   "name"
    t.text     "description"
    t.integer  "photos_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "views_count",  :default => 0
  end

  create_table "answers", :force => true do |t|
    t.integer  "ask_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",     :default => false
  end

  create_table "ask_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ask_category_id"
    t.string   "title"
    t.text     "content"
    t.integer  "score",           :default => 5
    t.integer  "answers_count",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "end_at"
    t.boolean  "solved",          :default => false
    t.boolean  "closed",          :default => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "space_id"
    t.integer  "item_id"
    t.string   "item_type"
    t.string   "reply"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", :force => true do |t|
    t.integer  "space_id"
    t.string   "title"
    t.text     "content"
    t.integer  "comments_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "views_count",    :default => 0
  end

  create_table "event_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eventors", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "phone"
    t.integer  "members"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_category_id"
    t.string   "title"
    t.string   "city"
    t.integer  "people"
    t.integer  "money"
    t.integer  "phone"
    t.text     "term"
    t.text     "introduction"
    t.text     "notes"
    t.string   "location"
    t.datetime "started_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "closed",            :default => false
    t.boolean  "offical",           :default => false
    t.integer  "views_count",       :default => 0
    t.integer  "members",           :default => 0
    t.integer  "comments_count",    :default => 0
  end

  create_table "forums", :force => true do |t|
    t.string   "title"
    t.integer  "topics_count", :default => 0
    t.integer  "posts_count",  :default => 0
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "passed",     :default => true
  end

  create_table "invite_codes", :force => true do |t|
    t.string   "login_name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "parent_id"
    t.string   "title"
    t.text     "content"
    t.boolean  "trashed",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "space_id"
    t.integer  "album_id"
    t.integer  "parent_id"
    t.string   "title"
    t.text     "description"
    t.integer  "comments_count", :default => 0
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.boolean  "primary"
    t.boolean  "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "views_count",    :default => 0
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forum_id"
  end

  add_index "posts", ["topic_id"], :name => "index_posts_on_topic_id"

  create_table "products", :force => true do |t|
    t.integer  "shop_id"
    t.integer  "counts"
    t.string   "name"
    t.string   "address"
    t.text     "introduction"
    t.text     "offer_description"
    t.text     "reservation_help"
    t.boolean  "is_recommend",      :default => false
    t.decimal  "price"
    t.float    "discount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shop_categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "shops_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops", :force => true do |t|
    t.string   "salt"
    t.string   "hashed_password"
    t.string   "login_name"
    t.integer  "shop_category_id"
    t.integer  "products_count"
    t.string   "shopname"
    t.string   "IDcard"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "postcode"
    t.boolean  "is_recommend",     :default => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spaces", :force => true do |t|
    t.integer  "user_id"
    t.string   "title",          :default => "这是你的标题"
    t.string   "address"
    t.text     "description",    :default => "这是你的空间描述"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "albums_count"
    t.integer  "photos_count"
    t.integer  "comments_count"
    t.integer  "entries_count"
    t.integer  "theme_id",       :default => 1
    t.string   "resolution",     :default => "800x600"
    t.integer  "views_count",    :default => 0
  end

  create_table "theme_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "themes", :force => true do |t|
    t.integer  "theme_category_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uri"
  end

  create_table "topics", :force => true do |t|
    t.integer  "user_id"
    t.integer  "forum_id"
    t.string   "title"
    t.text     "content"
    t.integer  "posts_count", :default => 0
    t.integer  "views_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_infos", :force => true do |t|
    t.string   "true_name"
    t.integer  "user_id"
    t.boolean  "sex"
    t.date     "birthday"
    t.string   "blood"
    t.integer  "height"
    t.integer  "weight"
    t.string   "bodytype"
    t.string   "from"
    t.string   "location"
    t.string   "job"
    t.string   "company"
    t.string   "position"
    t.string   "school"
    t.string   "educational"
    t.string   "belief"
    t.string   "dress"
    t.boolean  "drink",        :default => false
    t.boolean  "smoke",        :default => false
    t.string   "personality"
    t.string   "hobiy"
    t.string   "qq"
    t.string   "msn"
    t.string   "telephone"
    t.string   "mobilephone"
    t.integer  "authenticate", :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "overt",        :default => 1
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.integer  "score",           :default => 10
    t.integer  "grade_id"
    t.boolean  "enable",          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "topics_count",    :default => 0
    t.integer  "posts_count",     :default => 0
    t.integer  "asks_count",      :default => 0
    t.integer  "events_count",    :default => 0
  end

  create_table "visits", :force => true do |t|
    t.integer  "guest_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
