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

ActiveRecord::Schema.define(version: 20170131103853) do

  create_table "elements", force: :cascade do |t|
    t.string   "dictionary_type"
    t.integer  "dictionary_id"
    t.integer  "step_id"
    t.integer  "place"
    t.integer  "image_url_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["dictionary_type", "dictionary_id"], name: "index_elements_on_dictionary_type_and_dictionary_id"
  end

  create_table "image_urls", force: :cascade do |t|
    t.string   "dictionary_type"
    t.integer  "dictionary_id"
    t.string   "body"
    t.integer  "element_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["dictionary_type", "dictionary_id"], name: "index_image_urls_on_dictionary_type_and_dictionary_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.integer  "recipe_id"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tools", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "verbs", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
