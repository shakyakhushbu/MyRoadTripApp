class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string :city_name
      t.string :state_name
      t.timestamps
    end
  end
end
