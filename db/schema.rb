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

ActiveRecord::Schema.define(version: 2022_01_31_180431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "strava_activities", force: :cascade do |t|
    t.jsonb "raw"
    t.datetime "start_date", precision: 6
    t.integer "average_heartrate"
    t.integer "max_heartrate"
    t.string "name"
    t.integer "distance"
    t.bigint "user_credentials_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_credentials_id"], name: "index_strava_activities_on_user_credentials_id"
  end

  create_table "user_credentials", force: :cascade do |t|
    t.integer "athlete_id"
    t.integer "expires_at"
    t.integer "expires_in"
    t.string "refresh_token"
    t.string "access_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "username"
    t.string "firstname"
    t.string "lastname"
    t.integer "sex"
    t.string "picture"
    t.bigint "user_credentials_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_credentials_id"], name: "index_user_profiles_on_user_credentials_id"
  end

  add_foreign_key "strava_activities", "user_credentials", column: "user_credentials_id"
  add_foreign_key "user_profiles", "user_credentials", column: "user_credentials_id"
end
