# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_12_024137) do

  create_table "folders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags_url_items", id: false, force: :cascade do |t|
    t.integer "url_item_id", null: false
    t.integer "tag_id", null: false
    t.index ["tag_id"], name: "index_tags_url_items_on_tag_id"
    t.index ["url_item_id"], name: "index_tags_url_items_on_url_item_id"
  end

  create_table "url_item_tags", force: :cascade do |t|
    t.integer "url_item_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_id"], name: "index_url_item_tags_on_tag_id"
    t.index ["url_item_id"], name: "index_url_item_tags_on_url_item_id"
  end

  create_table "url_items", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.string "description"
    t.integer "folder_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["folder_id"], name: "index_url_items_on_folder_id"
  end

  add_foreign_key "url_item_tags", "tags"
  add_foreign_key "url_item_tags", "url_items"
  add_foreign_key "url_items", "folders"
end
