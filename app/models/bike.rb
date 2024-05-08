class Bike < ApplicationRecord
  belongs_to :user

  # validates :location, :price_per_day, presence: true
  # validates :condition, numericality: { only_integer: true }
  # validates :condition, inclusion: { in: 0..5 }
end
