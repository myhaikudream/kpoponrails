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

ActiveRecord::Schema.define(version: 2021_03_10_024318) do

  create_table "biaslists", force: :cascade do |t|
    t.integer "kpopidol_id"
    t.integer "user_id"
    t.string "notes"
  end

  create_table "checkout_lists", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "group_name"
    t.string "debut_date"
    t.string "fandom_name"
    t.string "instagram"
    t.string "twitter"
    t.string "youtube"
    t.string "group_img"
    t.string "music_video"
    t.string "live_video"
    t.string "dance_video"
    t.integer "recommendation_id"
    t.index ["recommendation_id"], name: "index_groups_on_recommendation_id"
  end

  create_table "kpopidols", force: :cascade do |t|
    t.string "stage_name"
    t.string "birth_name"
    t.string "birthday"
    t.string "birth_place"
    t.string "height"
    t.string "position"
    t.string "nickname"
    t.string "famous_quote"
    t.string "member_img"
    t.string "fan_cam"
    t.integer "group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "uid"
    t.string "provider"
  end

  add_foreign_key "groups", "groups", column: "recommendation_id"
end
