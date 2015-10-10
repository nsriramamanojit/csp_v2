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

ActiveRecord::Schema.define(version: 20150723115345) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "csp_code",       limit: 255
    t.string   "account_number", limit: 255
    t.string   "mobile",         limit: 255
    t.string   "state",          limit: 255
    t.string   "district",       limit: 255
    t.string   "location",       limit: 255
    t.string   "bank_name",      limit: 255
    t.string   "branch_name",    limit: 255
    t.string   "ifsc",           limit: 255
    t.string   "branch_code",    limit: 255
    t.string   "address",        limit: 255
    t.integer  "balance",        limit: 4
    t.boolean  "status",         limit: 1
    t.integer  "created_by",     limit: 4
    t.integer  "modified_by",    limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "role_id",    limit: 4
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "description",    limit: 255
    t.string   "reference_code", limit: 255
    t.boolean  "status",         limit: 1
    t.integer  "created_by",     limit: 4
    t.integer  "modified_by",    limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "csp_code",         limit: 255
    t.integer  "amount",           limit: 4
    t.date     "transaction_date"
    t.integer  "created_by",       limit: 4
    t.integer  "modified_by",      limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "user_sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255,   null: false
    t.text     "data",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                limit: 255, default: "",   null: false
    t.string   "login",               limit: 255
    t.boolean  "status",              limit: 1,   default: true
    t.string   "mobile",              limit: 255
    t.string   "crypted_password",    limit: 255,                null: false
    t.string   "password_salt",       limit: 255,                null: false
    t.string   "email",               limit: 255,                null: false
    t.string   "persistence_token",   limit: 255,                null: false
    t.string   "single_access_token", limit: 255,                null: false
    t.string   "perishable_token",    limit: 255,                null: false
    t.integer  "login_count",         limit: 4,   default: 0,    null: false
    t.integer  "failed_login_count",  limit: 4,   default: 0,    null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip",    limit: 255
    t.string   "last_login_ip",       limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "created_by",          limit: 4
    t.integer  "updated_by",          limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

end
