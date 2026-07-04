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

ActiveRecord::Schema[8.1].define(version: 2026_07_04_000200) do
  create_table "games", force: :cascade do |t|
    t.string "cabinet_code", default: "GAME", null: false
    t.datetime "created_at", null: false
    t.text "description", default: "", null: false
    t.string "genre", default: "Arcade", null: false
    t.integer "position", default: 0, null: false
    t.boolean "published", default: true, null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.string "url", null: false
    t.index ["position"], name: "index_games_on_position"
    t.index ["published"], name: "index_games_on_published"
  end

  create_table "site_settings", force: :cascade do |t|
    t.string "accent_color", default: "#39ff14", null: false
    t.string "background_color", default: "#07090f", null: false
    t.datetime "created_at", null: false
    t.text "footer_note", default: "Insert coin. Press start.", null: false
    t.string "headline", default: "Select Game", null: false
    t.string "secondary_color", default: "#ffcc00", null: false
    t.string "site_name", default: "LandingCade", null: false
    t.string "subheadline", default: "Boot menu ready. Choose a cabinet to launch.", null: false
    t.datetime "updated_at", null: false
  end
end
