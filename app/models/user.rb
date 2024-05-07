class User < ApplicationRecord
  has_many :bikes
  has_many :bookings
  validates :name, presence: true uniqueness: true
end
