class Game < ApplicationRecord
  validates :title, :url, :genre, :cabinet_code, presence: true
  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :published, -> { where(published: true) }
  scope :menu_order, -> { order(:position, :title) }
end
