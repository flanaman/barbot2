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

ActiveRecord::Schema.define(version: 20140203215509) do

  create_table "cocktails", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "cocktails", ["user_id"], name: "index_cocktails_on_user_id"

  create_table "components", force: true do |t|
    t.string   "amount"
    t.integer  "generic_id"
    t.integer  "ingredient_id"
    t.integer  "cocktail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "components", ["cocktail_id"], name: "index_components_on_cocktail_id"
  add_index "components", ["generic_id"], name: "index_components_on_generic_id"
  add_index "components", ["ingredient_id"], name: "index_components_on_ingredient_id"

  create_table "generics", force: true do |t|
    t.string   "name"
    t.integer  "proof"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "proof"
    t.integer  "rating"
    t.integer  "generic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
