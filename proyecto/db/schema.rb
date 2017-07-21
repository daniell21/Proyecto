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

ActiveRecord::Schema.define(version: 20170721034423) do

  create_table "Groups_Suppliers", id: false, force: :cascade do |t|
    t.integer "supplier_id", null: false
    t.integer "group_id",    null: false
  end

  add_index "Groups_Suppliers", ["group_id", "supplier_id"], name: "index_Groups_Suppliers_on_group_id_and_supplier_id"
  add_index "Groups_Suppliers", ["supplier_id", "group_id"], name: "index_Groups_Suppliers_on_supplier_id_and_group_id"

  create_table "accountpayables", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "total"
    t.integer  "supplier_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "accountpayables", ["supplier_id"], name: "index_accountpayables_on_supplier_id"

# Could not dump table "accountreceivables" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "clientmails", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clientmails", ["client_id"], name: "index_clientmails_on_client_id"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "email"
    t.boolean  "specialcontributor"
    t.integer  "rif"
    t.string   "country"
    t.text     "socialReason"
    t.string   "state"
    t.string   "profitCode"
  end

  create_table "clients_discounts", force: :cascade do |t|
    t.integer "client_id"
    t.integer "discount_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "discounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "has_discounts", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "discount_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "has_discounts", ["client_id"], name: "index_has_discounts_on_client_id"
  add_index "has_discounts", ["discount_id"], name: "index_has_discounts_on_discount_id"

  create_table "mailreminders", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "Supplier_id"
    t.integer  "Group_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "memberships", ["Group_id"], name: "index_memberships_on_Group_id"
  add_index "memberships", ["Supplier_id"], name: "index_memberships_on_Supplier_id"

  create_table "payments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "proof"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tops", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",           null: false
    t.string   "encrypted_password",     default: "",           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,            null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "name"
    t.string   "permission_level"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "role",                   default: "restricted"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
