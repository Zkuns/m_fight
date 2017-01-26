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

ActiveRecord::Schema.define(version: 20170123141959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "uuid-ossp"

  create_table "authorizations", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "user_id"
    t.string   "provider"
    t.string   "uid"
    t.json     "login_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid", "user_id"], name: "index_authorizations_on_provider_and_uid_and_user_id", using: :btree
  end

  create_table "fight_records", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "winner_id"
    t.uuid     "fight_1_id"
    t.uuid     "fight_2_id"
    t.json     "fight_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["winner_id", "fight_1_id", "fight_2_id"], name: "index_fight_records_on_winner_id_and_fight_1_id_and_fight_2_id", using: :btree
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "email"
    t.string   "phone"
    t.string   "encrypted_password", default: "", null: false
    t.string   "username"
    t.integer  "role"
    t.string   "avatar"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["email", "phone"], name: "index_users_on_email_and_phone", unique: true, using: :btree
  end

end
