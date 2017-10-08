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

ActiveRecord::Schema.define(version: 20150503163000) do

  create_table "experiences", force: :cascade do |t|
    t.string "heading", limit: 255
    t.text "content"
    t.integer "display_order", default: 0
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "worklist_id"
    t.integer "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["job_id"], name: "index_experiences_on_job_id"
    t.index ["worklist_id"], name: "index_experiences_on_worklist_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "employer", limit: 255
    t.integer "address_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "title", limit: 255
    t.string "employer_description", limit: 255
    t.text "description"
    t.integer "worklist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "address", limit: 255
    t.integer "display_order", default: 0
    t.index ["address_id"], name: "index_jobs_on_address_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.string "title", limit: 255
    t.string "grade", limit: 255
    t.string "institute", limit: 255
    t.integer "worklist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "display_order", default: 0
    t.index ["worklist_id"], name: "index_qualifications_on_worklist_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "title", limit: 255
    t.string "description", limit: 255
    t.integer "skill_id"
    t.boolean "key_skill"
    t.integer "user_id"
    t.integer "worklist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "job_id"
    t.integer "display_order", default: 0
    t.index ["skill_id"], name: "index_skills_on_skill_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "worklists", force: :cascade do |t|
    t.integer "user_id"
    t.string "url", limit: 255
    t.string "url_key", limit: 255
    t.string "title", limit: 255
    t.string "twitter", limit: 255
    t.string "facebook", limit: 255
    t.string "first_name", limit: 255
    t.string "middle_names", limit: 255
    t.string "last_name", limit: 255
    t.datetime "date_of_birth"
    t.string "email", limit: 255
    t.string "email_address", limit: 255
    t.string "address", limit: 255
    t.string "career_objectives", limit: 255
    t.string "website", limit: 255
    t.string "landline_phone", limit: 255
    t.string "mobile_phone", limit: 255
    t.text "description"
    t.text "summary"
    t.text "personal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
