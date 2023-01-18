class CreateHomes < ActiveRecord::Migration[7.0]
  def change
    create_table :homes do |t|
      t.string :trip_name
      t.string :trip_type
      t.belongs_to :trip, foreign_key: true
      t.timestamps
    end
  end
end
