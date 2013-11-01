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

ActiveRecord::Schema.define(version: 20130922160629) do

  create_table "jobs", force: true do |t|
    t.string   "employer"
    t.integer  "address_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "title"
    t.string   "employer_description"
    t.text     "description"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
  end

  add_index "jobs", ["address_id"], name: "index_jobs_on_address_id"

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "middle_names"
    t.string   "last_name"
    t.datetime "date_of_birth"
    t.string   "email"
    t.string   "website"
    t.string   "landline_phone"
    t.string   "mobile_phone"
    t.text     "description"
    t.text     "education"
    t.text     "work_history"
    t.text     "personal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "address"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "summary"
    t.string   "career_objectives"
    t.string   "qualifications"
    t.string   "url"
    t.string   "url_key"
  end

  create_table "qualifications", force: true do |t|
    t.string   "title"
    t.string   "grade"
    t.string   "institute"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "qualifications", ["profile_id"], name: "index_qualifications_on_profile_id"

  create_table "skills", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "skill_id"
    t.boolean  "key_skill"
    t.integer  "user_id"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
  end

  add_index "skills", ["skill_id"], name: "index_skills_on_skill_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
