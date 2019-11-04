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

ActiveRecord::Schema.define(version: 2019_11_04_045141) do

  create_table "faculties", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "teaching_field"
    t.integer "contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "designation"
  end

  create_table "students", force: :cascade do |t|
    t.integer "enrollnumber"
    t.string "firstname"
    t.string "lastname"
    t.string "branch"
    t.string "batch"
    t.integer "contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "password_digest"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
  end

end
