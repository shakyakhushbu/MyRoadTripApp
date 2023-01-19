class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.belongs_to :trip
      t.belongs_to :user
      t.timestamps
    end
  end
end
