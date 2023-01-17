class Destination < ApplicationRecord
  has_many :destination_trips
  has_many :trips, through: :destination_trips
  has_one :hotel
end
