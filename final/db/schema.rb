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

ActiveRecord::Schema.define(version: 2021_12_03_064154) do

  create_table "presentations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "team_id"
    t.index ["team_id"], name: "index_presentations_on_team_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "comments"
    t.string "overall"
    t.string "organization_1"
    t.string "organization_2"
    t.string "organization_3"
    t.string "organization_4"
    t.string "organization_5"
    t.string "organization_6"
    t.string "organization_7"
    t.string "content_1"
    t.string "content_2"
    t.string "content_3"
    t.string "content_4"
    t.string "visuals_1"
    t.string "visuals_2"
    t.string "visuals_3"
    t.string "visuals_4"
    t.string "visuals_5"
    t.string "delivery_1"
    t.string "delivery_2"
    t.string "delivery_3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "presentation_id"
    t.integer "user_id"
    t.index ["presentation_id"], name: "index_surveys_on_presentation_id"
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "team_id"
    t.integer "user_id"
    t.index ["team_id"], name: "index_team_members_on_team_id"
    t.index ["user_id"], name: "index_team_members_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
