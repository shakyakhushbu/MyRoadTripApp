class AddColumnToHomeCityName < ActiveRecord::Migration[7.0]
  def change
    add_column :homes, :city_name, :string
  end
end
