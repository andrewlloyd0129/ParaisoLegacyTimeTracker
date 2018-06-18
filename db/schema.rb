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

ActiveRecord::Schema.define(version: 20180615212110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.integer "job_number"
    t.string "job_name"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs_csvs", force: :cascade do |t|
    t.text "csv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payrollburden"
    t.bigint "job_id"
    t.index ["job_id"], name: "index_jobs_csvs_on_job_id"
  end

  create_table "task_entries", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "time_entries_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "task_id"
    t.bigint "time_entry_id"
    t.bigint "job_id"
    t.string "hours"
    t.integer "overtime"
    t.string "wage"
    t.string "gross_pay"
    t.string "payroll_burden"
    t.string "total_cost"
    t.index ["job_id"], name: "index_task_entries_on_job_id"
    t.index ["task_id"], name: "index_task_entries_on_task_id"
    t.index ["time_entries_id"], name: "index_task_entries_on_time_entries_id"
    t.index ["time_entry_id"], name: "index_task_entries_on_time_entry_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_entries", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.bigint "user_id"
    t.index ["user_id"], name: "index_time_entries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles"
    t.integer "wage"
    t.string "full_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "jobs_csvs", "jobs"
  add_foreign_key "task_entries", "jobs"
  add_foreign_key "task_entries", "tasks"
  add_foreign_key "task_entries", "time_entries"
  add_foreign_key "task_entries", "time_entries", column: "time_entries_id"
  add_foreign_key "time_entries", "users"
end
