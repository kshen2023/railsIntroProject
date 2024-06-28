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

ActiveRecord::Schema[7.1].define(version: 2024_06_28_220959) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "city_name"
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.float "city_area"
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "cities_pets", id: false, force: :cascade do |t|
    t.integer "city_id", null: false
    t.integer "pet_id", null: false
    t.integer "dogs"
    t.integer "cats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id", "pet_id"], name: "index_cities_pets_on_city_id_and_pet_id", unique: true
    t.index ["city_id"], name: "index_cities_pets_on_city_id"
    t.index ["pet_id"], name: "index_cities_pets_on_pet_id"
  end

  create_table "city_races", force: :cascade do |t|
    t.integer "city_id", null: false
    t.integer "race_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_city_races_on_city_id"
    t.index ["race_id"], name: "index_city_races_on_race_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "country_name"
    t.string "continent"
    t.integer "population"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "country_languages", force: :cascade do |t|
    t.integer "country_id", null: false
    t.integer "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_country_languages_on_country_id"
    t.index ["language_id"], name: "index_country_languages_on_language_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "language_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language_code"
  end

  create_table "pets", force: :cascade do |t|
    t.string "country"
    t.integer "dogs"
    t.integer "cats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "race_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "race_population"
  end

  create_table "weathers", force: :cascade do |t|
    t.string "name"
    t.datetime "datetime"
    t.float "tempmax"
    t.float "tempmin"
    t.float "temp"
    t.float "feelslikemax"
    t.float "feelslikemin"
    t.float "feelslike"
    t.float "dew"
    t.float "humidity"
    t.integer "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_weathers_on_city_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cities", "countries"
  add_foreign_key "cities_pets", "cities"
  add_foreign_key "cities_pets", "pets"
  add_foreign_key "city_races", "cities"
  add_foreign_key "city_races", "races"
  add_foreign_key "country_languages", "countries"
  add_foreign_key "country_languages", "languages"
  add_foreign_key "weathers", "cities"
end
