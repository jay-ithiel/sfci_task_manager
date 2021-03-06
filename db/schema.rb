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

ActiveRecord::Schema.define(version: 20180101074018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "department_sub_tasks", force: :cascade do |t|
    t.integer  "department_id", null: false
    t.integer  "sub_task_id",   null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id", "sub_task_id"], name: "index_department_sub_tasks_on_department_id_and_sub_task_id", unique: true, using: :btree
    t.index ["department_id"], name: "index_department_sub_tasks_on_department_id", using: :btree
    t.index ["sub_task_id"], name: "index_department_sub_tasks_on_sub_task_id", using: :btree
  end

  create_table "department_tasks", force: :cascade do |t|
    t.integer  "department_id", null: false
    t.integer  "task_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_departments_on_name", using: :btree
  end

  create_table "employee_departments", force: :cascade do |t|
    t.integer  "employee_id",   null: false
    t.integer  "department_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_employees_on_email", using: :btree
    t.index ["username"], name: "index_employees_on_username", using: :btree
  end

  create_table "sub_tasks", force: :cascade do |t|
    t.string   "name",                         null: false
    t.text     "description",                  null: false
    t.integer  "task_id",                      null: false
    t.integer  "assignee_id",                  null: false
    t.integer  "assigner_id",                  null: false
    t.datetime "due_date",                     null: false
    t.boolean  "is_completed", default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name",                        null: false
    t.text     "description",                 null: false
    t.integer  "assignee_id",                 null: false
    t.integer  "assigner_id",                 null: false
    t.datetime "due_date",                    null: false
    t.boolean  "completed",   default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
