class AddReferenceToTrip < ActiveRecord::Migration[7.0]
  def change
    add_reference :trips, :destination, foreign_key: true
  end
end
