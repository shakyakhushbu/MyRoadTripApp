class DestinationTrip < ApplicationRecord
  belongs_to :trip
  belongs_to :destination
end
