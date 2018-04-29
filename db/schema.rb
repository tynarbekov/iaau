# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180420183024) do

  create_table "computer_skill_lists", force: :cascade do |t|
    t.string   "comp_skill"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "computer_skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_level_id"
    t.integer  "computer_skill_list_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["computer_skill_list_id"], name: "index_computer_skills_on_computer_skill_list_id"
    t.index ["skill_level_id"], name: "index_computer_skills_on_skill_level_id"
    t.index ["user_id"], name: "index_computer_skills_on_user_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string   "place"
    t.string   "period"
    t.string   "faculty"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string   "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proffesional_skill_lists", force: :cascade do |t|
    t.string   "proff_skill"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "proffesional_skills", force: :cascade do |t|
    t.integer  "skill_level_id"
    t.integer  "proffesional_skill_list_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["proffesional_skill_list_id"], name: "index_proffesional_skills_on_proffesional_skill_list_id"
    t.index ["skill_level_id"], name: "index_proffesional_skills_on_skill_level_id"
    t.index ["user_id"], name: "index_proffesional_skills_on_user_id"
  end

  create_table "skill_levels", force: :cascade do |t|
    t.string   "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "org_skill"
    t.string   "publication"
    t.string   "project"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "user_languages", force: :cascade do |t|
    t.integer  "language_id"
    t.integer  "user_id"
    t.integer  "skill_level_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["language_id"], name: "index_user_languages_on_language_id"
    t.index ["skill_level_id"], name: "index_user_languages_on_skill_level_id"
    t.index ["user_id"], name: "index_user_languages_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                           null: false
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.string   "profile_image"
    t.date     "date_of_birth"
    t.integer  "gender_id"
    t.integer  "user_role_id"
    t.integer  "group_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["gender_id"], name: "index_users_on_gender_id"
    t.index ["group_id"], name: "index_users_on_group_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_role_id"], name: "index_users_on_user_role_id"
  end

  create_table "work_experiences", force: :cascade do |t|
    t.string   "place"
    t.string   "work_period"
    t.string   "position"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_work_experiences_on_user_id"
  end

end
