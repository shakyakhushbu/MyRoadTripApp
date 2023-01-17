class AddNewColumnToDestination < ActiveRecord::Migration[7.0]
  def change
    add_column :destinations, :hotel_name, :string
  end
end
