class AddColumnToHome < ActiveRecord::Migration[7.0]
  def change
    add_column :homes, :amount, :integer
    add_column :homes, :start_date, :datetime
    add_column :homes, :end_date, :datetime
  end
end
