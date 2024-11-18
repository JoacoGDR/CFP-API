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

ActiveRecord::Schema[7.2].define(version: 2024_10_20_034122) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
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

  create_table "business_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catch_quota_allocations", force: :cascade do |t|
    t.bigint "species_id", null: false
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.float "amount", null: false
    t.date "allocation_date", null: false
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_catch_quota_allocations_on_owner"
    t.index ["species_id"], name: "index_catch_quota_allocations_on_species_id"
  end

  create_table "catch_quotas", force: :cascade do |t|
    t.bigint "catch_quota_allocation_id"
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.bigint "species_id", null: false
    t.float "quota", null: false
    t.date "start_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catch_quota_allocation_id"], name: "index_catch_quotas_on_catch_quota_allocation_id"
    t.index ["owner_type", "owner_id"], name: "index_catch_quotas_on_owner"
    t.index ["species_id"], name: "index_catch_quotas_on_species_id"
  end

  create_table "catches", force: :cascade do |t|
    t.boolean "incidental", default: false, null: false
    t.bigint "vessel_id", null: false
    t.bigint "species_id", null: false
    t.float "weight", null: false
    t.date "date", null: false
    t.json "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["species_id"], name: "index_catches_on_species_id"
    t.index ["vessel_id"], name: "index_catches_on_vessel_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.bigint "business_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_group_id"], name: "index_companies_on_business_group_id"
  end

  create_table "company_ownership_changes", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "previous_owner_id", null: false
    t.bigint "new_owner_id", null: false
    t.date "change_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_ownership_changes_on_company_id"
    t.index ["new_owner_id"], name: "index_company_ownership_changes_on_new_owner_id"
    t.index ["previous_owner_id"], name: "index_company_ownership_changes_on_previous_owner_id"
  end

  create_table "consumers", force: :cascade do |t|
    t.string "name", null: false
    t.string "api_key", null: false
    t.string "api_secret", null: false
    t.datetime "last_nonce", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_key"], name: "index_consumers_on_api_key", unique: true
    t.index ["name"], name: "index_consumers_on_name", unique: true
  end

  create_table "maximum_allowable_catches", force: :cascade do |t|
    t.string "detail", default: "", null: false
    t.bigint "species_id", null: false
    t.float "weight", null: false
    t.date "start_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["species_id"], name: "index_maximum_allowable_catches_on_species_id"
  end

  create_table "public_entities", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sanctions", force: :cascade do |t|
    t.bigint "vessel_id"
    t.string "description"
    t.integer "type", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vessel_id"], name: "index_sanctions_on_vessel_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transfers", force: :cascade do |t|
    t.bigint "source_quota_id", null: false
    t.bigint "destination_quota_id", null: false
    t.float "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_quota_id"], name: "index_transfers_on_destination_quota_id"
    t.index ["source_quota_id"], name: "index_transfers_on_source_quota_id"
  end

  create_table "vessel_name_changes", force: :cascade do |t|
    t.bigint "vessel_id", null: false
    t.string "previous_name", null: false
    t.string "new_name", null: false
    t.date "change_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vessel_id"], name: "index_vessel_name_changes_on_vessel_id"
  end

  create_table "vessel_ownership_changes", force: :cascade do |t|
    t.bigint "vessel_id", null: false
    t.bigint "previous_owner_id", null: false
    t.bigint "new_owner_id", null: false
    t.date "change_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["new_owner_id"], name: "index_vessel_ownership_changes_on_new_owner_id"
    t.index ["previous_owner_id"], name: "index_vessel_ownership_changes_on_previous_owner_id"
    t.index ["vessel_id"], name: "index_vessel_ownership_changes_on_vessel_id"
  end

  create_table "vessels", force: :cascade do |t|
    t.string "registration_code", null: false
    t.string "name", null: false
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_vessels_on_company_id"
    t.index ["registration_code"], name: "index_vessels_on_registration_code", unique: true
  end

  add_foreign_key "catch_quota_allocations", "species"
  add_foreign_key "catch_quotas", "catch_quota_allocations"
  add_foreign_key "catch_quotas", "species"
  add_foreign_key "catches", "species"
  add_foreign_key "catches", "vessels"
  add_foreign_key "companies", "business_groups"
  add_foreign_key "company_ownership_changes", "business_groups", column: "new_owner_id"
  add_foreign_key "company_ownership_changes", "business_groups", column: "previous_owner_id"
  add_foreign_key "company_ownership_changes", "companies"
  add_foreign_key "maximum_allowable_catches", "species"
  add_foreign_key "sanctions", "vessels"
  add_foreign_key "transfers", "catch_quotas", column: "destination_quota_id"
  add_foreign_key "transfers", "catch_quotas", column: "source_quota_id"
  add_foreign_key "vessel_name_changes", "vessels"
  add_foreign_key "vessel_ownership_changes", "companies", column: "new_owner_id"
  add_foreign_key "vessel_ownership_changes", "companies", column: "previous_owner_id"
  add_foreign_key "vessel_ownership_changes", "vessels"
  add_foreign_key "vessels", "companies"
end
