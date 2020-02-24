# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_24_062100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "device_instances", force: :cascade do |t|
    t.bigint "device_id"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_device_instances_on_device_id"
    t.index ["project_id"], name: "index_device_instances_on_project_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.string "folder_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "sticker_instances", force: :cascade do |t|
    t.bigint "sticker_id"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_sticker_instances_on_project_id"
    t.index ["sticker_id"], name: "index_sticker_instances_on_sticker_id"
  end

  create_table "stickers", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "height"
    t.integer "width"
    t.boolean "favorite", default: false
    t.boolean "selected", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "device_instances", "devices"
  add_foreign_key "device_instances", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "sticker_instances", "projects"
  add_foreign_key "sticker_instances", "stickers"
end
