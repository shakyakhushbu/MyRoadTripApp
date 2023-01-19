class AddColumnToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :user_name, :string
    add_column :bookings, :contact_detail, :integer
  end
end
