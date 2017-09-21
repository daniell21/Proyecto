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

ActiveRecord::Schema.define(version: 20170921074205) do

  create_table "accountpayables", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "supplier_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.date     "date"
    t.text     "concept"
    t.text     "comment"
    t.boolean  "paid"
    t.string   "profitNumber"
    t.decimal  "amountPaid",   precision: 15, scale: 2
  end

  add_index "accountpayables", ["supplier_id"], name: "index_accountpayables_on_supplier_id"

  create_table "accountreceivables", force: :cascade do |t|
    t.integer  "client_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.date     "date"
    t.string   "profitCode"
    t.string   "status"
    t.string   "bank"
    t.string   "paymentType"
    t.string   "profitNumber"
    t.string   "document"
    t.string   "clientAccount"
    t.string   "checkNumber"
    t.string   "depositNumber"
    t.string   "transferNumberClient"
    t.integer  "month"
    t.string   "transferNumber"
    t.boolean  "paid"
    t.integer  "rate_id"
    t.string   "elemetricaAccount"
    t.decimal  "amountPaid",           precision: 15, scale: 2
    t.decimal  "accountBalance",       precision: 15, scale: 2
    t.decimal  "baseAmount",           precision: 15, scale: 2
    t.decimal  "amountWithoutTax",     precision: 15, scale: 2
    t.decimal  "amountWithTax",        precision: 15, scale: 2
    t.decimal  "totalRetentions",      precision: 15, scale: 2
    t.decimal  "totalAmountPerceive",  precision: 15, scale: 2
    t.text     "paymentComment"
  end

  add_index "accountreceivables", ["client_id"], name: "index_accountreceivables_on_client_id"
  add_index "accountreceivables", ["rate_id"], name: "index_accountreceivables_on_rate_id"

  create_table "client_mails", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "body"
  end

  add_index "client_mails", ["client_id"], name: "index_client_mails_on_client_id"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "specialcontributor"
    t.string   "country"
    t.text     "socialReason"
    t.string   "state"
    t.string   "profitCode"
    t.string   "code"
    t.string   "completeCountry"
    t.boolean  "chargeMonthlyFee"
    t.text     "comment"
    t.string   "rif"
    t.decimal  "specialDiscount",    precision: 5, scale: 2
    t.integer  "localAmount"
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
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.decimal  "percentage", precision: 5, scale: 2
  end

  create_table "emails", force: :cascade do |t|
    t.string   "email"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "emails", ["client_id"], name: "index_emails_on_client_id"

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

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "amount",     precision: 15, scale: 2
  end

  create_table "reminders", force: :cascade do |t|
    t.string   "name"
    t.integer  "frecuency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "chart"
  end

  create_table "search_accountpayables", force: :cascade do |t|
    t.string   "keywords"
    t.date     "date"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "search_accountreceivables", force: :cascade do |t|
    t.string   "keywords"
    t.string   "paymentType"
    t.string   "status"
    t.string   "bank"
    t.date     "date"
    t.boolean  "paid"
    t.string   "month"
    t.integer  "rate_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "search_client_payments", force: :cascade do |t|
    t.integer  "keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_clients", force: :cascade do |t|
    t.string   "keywords"
    t.integer  "rif"
    t.string   "profitCode"
    t.string   "email"
    t.string   "specialcontributor"
    t.string   "state"
    t.string   "socialReason"
    t.string   "discounts"
    t.string   "country"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "search_discounts", force: :cascade do |t|
    t.string   "keywords"
    t.integer  "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_suppliers", force: :cascade do |t|
    t.string   "keywords"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "socialReason"
    t.text     "address"
    t.string   "category"
    t.string   "email"
    t.string   "rif"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,        null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "name"
    t.string   "permission_level"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "role",                   default: "client"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
