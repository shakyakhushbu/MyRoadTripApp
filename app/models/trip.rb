class Trip < ApplicationRecord
  has_many :destination_trips
  has_many :destinations, through: :destination_trips
  # has_one :home,  dependent: :destroy
  has_one_attached :main_image
  has_many :booking
end
