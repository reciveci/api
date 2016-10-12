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

ActiveRecord::Schema.define(version: 20161012204225) do

  create_table "affiliations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sector",     limit: 255
    t.string   "email",      limit: 255
    t.string   "phone1",     limit: 255
    t.boolean  "publish",    limit: 255
    t.string   "direccion",  limit: 255
    t.string   "extension",  limit: 255
    t.integer  "city_id"
    t.float    "latitude"
    t.float    "longitud"
  end

  add_index "affiliations", ["city_id"], name: "index_affiliations_on_city_id"

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "extension",  limit: 255
    t.string   "image",      limit: 255
  end

  create_table "businesses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_name",  limit: 255
    t.integer  "column"
    t.string   "waste_type",  limit: 255
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colors", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.string   "codigo",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "examples", force: :cascade do |t|
    t.string   "name",           limit: 255,                null: false
    t.boolean  "enabled",                    default: true, null: false
    t.integer  "subcategory_id",                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "examples", ["subcategory_id"], name: "index_examples_on_subcategory_id"

  create_table "line_strings", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.text     "coordinates", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "route_id"
  end

  add_index "line_strings", ["route_id"], name: "index_line_strings_on_route_id"

  create_table "rates", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description"
    t.string   "image_name",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recycling_way_images", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.string   "url",             limit: 255
    t.integer  "recyclingWay_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recycling_way_images", ["recyclingWay_id"], name: "index_recycling_way_images_on_recyclingWay_id"

  create_table "recycling_ways", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "description",    limit: 255
    t.integer  "subcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_name",     limit: 255
  end

  add_index "recycling_ways", ["subcategory_id"], name: "index_recycling_ways_on_subcategory_id"

  create_table "routes", force: :cascade do |t|
    t.string   "name",            limit: 255, null: false
    t.string   "schedule",        limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "waste_picker_id"
    t.integer  "color_id"
    t.integer  "sector_id"
  end

  add_index "routes", ["color_id"], name: "index_routes_on_color_id"
  add_index "routes", ["sector_id"], name: "index_routes_on_sector_id"
  add_index "routes", ["waste_picker_id"], name: "index_routes_on_waste_picker_id"

  create_table "sectors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "enabled"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "color_id"
  end

  add_index "sectors", ["city_id"], name: "index_sectors_on_city_id"
  add_index "sectors", ["color_id"], name: "index_sectors_on_color_id"

  create_table "subcategories", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 255
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_name",   limit: 255
    t.text     "examples"
    t.text     "instructions"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "user_apps", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_apps", ["email"], name: "index_user_apps_on_email"
  add_index "user_apps", ["reset_password_token"], name: "index_user_apps_on_reset_password_token", unique: true
  add_index "user_apps", ["uid", "provider"], name: "index_user_apps_on_uid_and_provider", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 255
    t.string   "role",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "waste_pickers", force: :cascade do |t|
    t.string   "name",           limit: 255, null: false
    t.date     "birth_date"
    t.date     "start_date"
    t.text     "background"
    t.string   "message",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "affiliation_id"
    t.string   "fullName",       limit: 255
    t.string   "gender",         limit: 255
  end

  add_index "waste_pickers", ["affiliation_id"], name: "index_waste_pickers_on_affiliation_id"

end
