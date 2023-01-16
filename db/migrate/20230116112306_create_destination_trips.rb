class CreateDestinationTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :destination_trips do |t|
      t.belongs_to :destination
      t.belongs_to :trip
      t.timestamps
    end
  end
end
