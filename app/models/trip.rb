class Trip < ApplicationRecord
  has_many :destination_trips
  has_many :destinations, through: :destination_trips
end
