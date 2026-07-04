class SiteSetting < ApplicationRecord
  COLOR_PATTERN = /\A#[0-9a-fA-F]{6}\z/

  validates :site_name, :headline, :subheadline, :footer_note, presence: true
  validates :accent_color, :secondary_color, :background_color,
    presence: true,
    format: { with: COLOR_PATTERN, message: "must be a hex color like #39ff14" }

  def self.current
    first_or_create!
  end
end
