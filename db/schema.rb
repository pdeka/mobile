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

ActiveRecord::Schema.define(:version => 6) do

  create_table "dimensions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dimensions_users", :force => true do |t|
    t.integer "user_id"
    t.integer "dimension_id"
  end

  create_table "situational_datas", :force => true do |t|
    t.string  "location"
    t.text    "accompanying_people"
    t.text    "significant_occurences"
    t.integer "user_rating_id"
  end

  create_table "user_ratings", :force => true do |t|
    t.integer  "rating"
    t.integer  "reference_number"
    t.string   "channel"
    t.integer  "user_id"
    t.integer  "dimension_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "usernumber"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
