class Bike < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :location, :price_per_day, presence: true
  validates :condition, numericality: { only_integer: true }
  validates :condition, inclusion: { in: 0..5 }
end
