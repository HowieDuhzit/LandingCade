class CreateGames < ActiveRecord::Migration[8.1]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :genre, null: false, default: "Arcade"
      t.string :cabinet_code, null: false, default: "GAME"
      t.text :description, null: false, default: ""
      t.integer :position, null: false, default: 0
      t.boolean :published, null: false, default: true

      t.timestamps
    end

    add_index :games, :position
    add_index :games, :published
  end
end
