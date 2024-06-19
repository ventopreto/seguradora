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

ActiveRecord::Schema.define(version: 2024_06_20_134434) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "insureds", force: :cascade do |t|
    t.string "name"
    t.bigint "cpf"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "policies", force: :cascade do |t|
    t.string "start_date"
    t.string "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "insured_id", null: false
    t.index ["insured_id"], name: "index_policies_on_insured_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "year"
    t.string "registration_plate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "policy_id", null: false
    t.index ["policy_id"], name: "index_vehicles_on_policy_id"
  end

  add_foreign_key "policies", "insureds"
  add_foreign_key "vehicles", "policies"
end
