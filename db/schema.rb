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

ActiveRecord::Schema[7.2].define(version: 2024_11_07_165511) do
  create_table "group_classes", force: :cascade do |t|
    t.integer "gym_staff_id", null: false
    t.date "date"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "class_type"
    t.index ["gym_staff_id"], name: "index_group_classes_on_gym_staff_id"
  end

  create_table "group_members", force: :cascade do |t|
    t.integer "group_class_id", null: false
    t.integer "gym_member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_class_id"], name: "index_group_members_on_group_class_id"
    t.index ["gym_member_id"], name: "index_group_members_on_gym_member_id"
  end

  create_table "gym_members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.date "birth_date"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gym_staffs", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.date "birth_date"
    t.string "address"
    t.date "admission_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "private_classes", force: :cascade do |t|
    t.integer "gym_staff_id", null: false
    t.integer "gym_member_id", null: false
    t.date "date"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_member_id"], name: "index_private_classes_on_gym_member_id"
    t.index ["gym_staff_id"], name: "index_private_classes_on_gym_staff_id"
  end

  add_foreign_key "group_classes", "gym_staffs"
  add_foreign_key "group_members", "group_classes"
  add_foreign_key "group_members", "gym_members"
  add_foreign_key "private_classes", "gym_members"
  add_foreign_key "private_classes", "gym_staffs"
end
