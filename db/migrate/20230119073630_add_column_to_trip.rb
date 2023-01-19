class AddColumnToTrip < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :city_name, :string
  end
end
