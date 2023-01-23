class AddBookingTokenToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :booking_token, :string
    add_index :bookings, :booking_token, unique: true
  end
end
