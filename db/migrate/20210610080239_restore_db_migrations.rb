class RestoreDbMigrations < ActiveRecord::Migration[5.1]
  def change
    create_table "albums", force: :cascade do |t|
      t.bigint "user_id"
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id"], name: "index_albums_on_user_id"
    end

    create_table "photos", force: :cascade do |t|
      t.bigint "album_id"
      t.text "description", default: ""
      t.string "image"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["album_id"], name: "index_photos_on_album_id"
    end

    create_table "users", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer "sign_in_count", default: 0, null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.inet "current_sign_in_ip"
      t.inet "last_sign_in_ip"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "username"
      t.string "first_name"
      t.string "last_name"
      t.string "image"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end

    add_foreign_key "albums", "users"
    add_foreign_key "photos", "albums"
  end
end
