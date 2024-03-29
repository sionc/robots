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

ActiveRecord::Schema.define(:version => 20110924071028) do

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "robot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["robot_id", "created_at"], :name => "index_microposts_on_robot_id_and_created_at"

  create_table "relationships", :force => true do |t|
    t.integer  "tracker_id"
    t.integer  "trackee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["trackee_id"], :name => "index_relationships_on_trackee_id"
  add_index "relationships", ["tracker_id", "trackee_id"], :name => "index_relationships_on_tracker_id_and_trackee_id", :unique => true
  add_index "relationships", ["tracker_id"], :name => "index_relationships_on_tracker_id"

  create_table "robots", :force => true do |t|
    t.string   "name"
    t.string   "model"
    t.string   "description"
    t.string   "hardware"
    t.string   "software"
    t.string   "applications"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
