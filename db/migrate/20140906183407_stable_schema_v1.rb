class StableSchemaV1 < ActiveRecord::Migration
  def change
    create_table "dislikes", force: true do |t|
      t.string  "type_of"
      t.timestamps
    end

    create_table "matches", force: true do |t|
      t.timestamps
      t.integer  "match_id"
      t.integer  "user_id"
      t.boolean "match_confirm"
      t.boolean "user_confirm"
    end

    create_table "chatrooms", force: true do |t|
      t.references :matches
      t.timestamps
    end

    create_table "messages", force: true do |t|
      t.text :content
      t.timestamps
      t.references :chatrooms
    end

    create_table "users", force: true do |t|
      t.string   "provider"
      t.string   "uid"
      t.string   "name"
      t.string   "oauth_token"
      t.datetime "oauth_expires_at"
      t.timestamps
      t.string   "email"
      t.string   "image"
      t.boolean   "gender"
      t.boolean   "gender_interest"
      t.references :dislikes
    end
  end
end
