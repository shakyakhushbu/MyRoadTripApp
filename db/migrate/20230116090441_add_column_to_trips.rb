class AddColumnToTrips < ActiveRecord::Migration[7.0]
  def up
    add_column :trips, :trip_type, :string
    add_column :trips, :amount, :integer
    add_column :trips, :start_date, :datetime
    add_column :trips, :end_date, :datetime
  end
  def down
    remove_column :trips, :trip_type, :string
    remove_column :trips, :amount, :integer
    remove_column :trips, :start_date, :datetime
    remove_column :trips, :end_date, :datetime
  end
end
