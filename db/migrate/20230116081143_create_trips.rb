class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :trip_name
      t.timestamps
    end
  end
end
