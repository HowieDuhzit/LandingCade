class CreateSiteSettings < ActiveRecord::Migration[8.1]
  def change
    create_table :site_settings do |t|
      t.string :site_name, null: false, default: "Arcade Menu"
      t.string :headline, null: false, default: "Select Game"
      t.string :subheadline, null: false, default: "Boot menu ready. Choose a cabinet to launch."
      t.string :accent_color, null: false, default: "#39ff14"
      t.string :secondary_color, null: false, default: "#ffcc00"
      t.string :background_color, null: false, default: "#07090f"
      t.text :footer_note, null: false, default: "Insert coin. Press start."

      t.timestamps
    end
  end
end
