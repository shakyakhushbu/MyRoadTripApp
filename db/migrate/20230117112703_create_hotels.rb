class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.belongs_to :destination
      t.string :hotel_name
      t.timestamps
    end
  end
end
