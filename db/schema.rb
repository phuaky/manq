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

ActiveRecord::Schema.define(version: 20161010001448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "biz_users", force: :cascade do |t|
    t.integer  "registered_user_id"
    t.string   "reg_no"
    t.string   "company_name"
    t.text     "address"
    t.string   "contact_person"
    t.integer  "contact_no"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "customers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "store_id"
    t.integer  "queue_no"
    t.integer  "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "store_id"], name: "index_customers_on_user_id_and_store_id", unique: true, using: :btree
  end

  create_table "historical_customers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "store_id"
    t.integer  "queue_no"
    t.integer  "status_id"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registered_users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "user_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "status_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "stores", force: :cascade do |t|
    t.integer  "registered_user_id"
    t.integer  "biz_user_id"
    t.string   "store_name"
    t.string   "store_address"
    t.integer  "contact_no"
    t.string   "contact_person"
    t.integer  "max_queue_no"
    t.integer  "max_queue_allow"
    t.integer  "max_leeway"
    t.float    "reservation_fee"
    t.string   "store_picture"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.string   "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "phone_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
