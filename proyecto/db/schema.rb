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

ActiveRecord::Schema.define(version: 20170930152422) do

  create_table "accountpayable_imports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accountpayables", force: :cascade do |t|
    t.integer  "supplier_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.date     "date"
    t.text     "comment"
    t.string   "profitNumber"
    t.decimal  "amountPaid",   precision: 15, scale: 2
    t.text     "descripcion"
  end

  add_index "accountpayables", ["supplier_id"], name: "index_accountpayables_on_supplier_id"

  create_table "accountreceivable_imports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accountreceivables", force: :cascade do |t|
    t.integer  "client_id"
    t.text     "descripcion"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "invoicenumber"
    t.date     "date"
    t.string   "code"
    t.string   "profitCode"
    t.string   "status"
    t.string   "bank"
    t.string   "paymentType"
    t.string   "profitNumber"
    t.string   "document"
    t.string   "elemetricaAcount"
    t.string   "clientAccount"
    t.string   "checkNumber"
    t.string   "depositNumber"
    t.string   "transferNumberClient"
    t.integer  "constant_id"
    t.integer  "month"
    t.string   "transferNumber"
    t.boolean  "paid"
    t.integer  "rate_id"
    t.string   "elemetricaAccount"
    t.decimal  "accountBalance",       precision: 15, scale: 2
    t.decimal  "baseAmount",           precision: 15, scale: 2
    t.decimal  "amountWithoutTax",     precision: 15, scale: 2
    t.decimal  "amountWithTax",        precision: 15, scale: 2
    t.decimal  "totalRetentions",      precision: 15, scale: 2
    t.decimal  "totalAmountPerceive",  precision: 15, scale: 2
    t.text     "paymentComment"
    t.decimal  "amountPaid",           precision: 15, scale: 2
  end

  add_index "accountreceivables", ["client_id"], name: "index_accountreceivables_on_client_id"
  add_index "accountreceivables", ["constant_id"], name: "index_accountreceivables_on_constant_id"
  add_index "accountreceivables", ["rate_id"], name: "index_accountreceivables_on_rate_id"

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "apiusers", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_imports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_mails", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.date     "date"
    t.integer  "client_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "massMailings"
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
    t.string   "localId"
    t.date     "lastPayment"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "amount",     precision: 15, scale: 2
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

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",                               null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",                          null: false
    t.string   "scopes"
    t.string   "previous_refresh_token", default: "", null: false
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true

  create_table "rates", force: :cascade do |t|
    t.string   "name"
    t.decimal  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "chart"
  end

  create_table "search_accountpayables", force: :cascade do |t|
    t.string   "keywords"
    t.date     "date"
    t.string   "descripcion"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "profitNumber"
    t.decimal  "amountPaid",   precision: 15, scale: 2
    t.integer  "supplier_id"
  end

  create_table "search_accountreceivables", force: :cascade do |t|
    t.string   "paymentType"
    t.string   "status"
    t.string   "bank"
    t.date     "date"
    t.boolean  "paid"
    t.integer  "rate_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "profitCode"
    t.string   "profitNumber"
    t.string   "clientAccount"
    t.string   "checkNumber"
    t.string   "depositNumber"
    t.string   "transferNumberClient"
    t.integer  "month"
    t.string   "transferNumber"
    t.string   "elemetricaAccount"
    t.decimal  "amountPaid",           precision: 15, scale: 2
  end

  create_table "search_client_payments", force: :cascade do |t|
    t.integer  "keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_clients", force: :cascade do |t|
    t.integer  "rif"
    t.string   "profitCode"
    t.string   "email"
    t.string   "state"
    t.string   "socialReason"
    t.string   "discounts"
    t.string   "country"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "name"
    t.decimal  "specialDiscount",    precision: 15, scale: 2
    t.boolean  "chargeMonthlyFee"
    t.integer  "localAmount"
    t.boolean  "specialcontributor"
  end

  create_table "search_discounts", force: :cascade do |t|
    t.string   "keywords"
    t.integer  "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_suppliers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.string   "rif"
    t.text     "socialReason"
    t.text     "address"
  end

  create_table "supplier_imports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "socialReason"
    t.text     "address"
    t.string   "rif"
    t.text     "comment"
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
