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

ActiveRecord::Schema.define(version: 2022_02_28_143242) do

  create_table "key_resources", force: :cascade do |t|
    t.string "title"
    t.text "url"
    t.string "url_hash"
    t.string "description"
    t.text "contexts"
    t.text "keywords"
    t.text "categories"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_key_resources_on_title", unique: true
    t.index ["url_hash"], name: "index_key_resources_on_url_hash", unique: true
  end

  create_table "logs", force: :cascade do |t|
    t.text "user_agent"
    t.text "referrer"
    t.string "remote_ip"
    t.string "logset", null: false
    t.text "logdata"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 40
    t.string "last_name", limit: 40
    t.string "uid", limit: 10
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["uid"], name: "index_users_on_uid"
  end

end
