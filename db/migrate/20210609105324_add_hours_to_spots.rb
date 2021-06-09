class AddHoursToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :hours, :float
  end
end
