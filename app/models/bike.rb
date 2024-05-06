class Bike < ApplicationRecord
  belongs_to :user

  validates :location, :price_per_day, presence: true
  validates :condition, numericality: { only_integer: true }
  validates :condition, inclusion: { in: %w(1 2 3 4 5) }
end
