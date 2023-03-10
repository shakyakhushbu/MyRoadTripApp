class Trip < ApplicationRecord
  has_many :destination_trips
  has_many :destinations, through: :destination_trips
  # has_one :home,  dependent: :destroy
  has_one_attached :main_image
  has_many :bookings
  has_many :users, through: :bookings
  validates :trip_name, uniqueness: true
  validates :amount, numericality: { greater_than: 2000}

  scope :filter_by_amount, -> (min, max) { where('amount >= ? AND amount <= ?', min, max) }
  scope :filter_by_trip_type, -> (trip_type) { where('trip_type = ?', trip_type) }
  scope :filter_by_start_and_end_date, -> (start_date, end_date) { where("start_date >= ? AND end_date <= ?", start_date, end_date) }
end
