class User < ApplicationRecord
  has_many :bikes
  has_many :bookings
end
