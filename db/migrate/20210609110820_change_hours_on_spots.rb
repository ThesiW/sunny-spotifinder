class ChangeHoursOnSpots < ActiveRecord::Migration[6.0]
  def change
    change_column :spots, :hours, :string, :default => "9:00 - 16:30h"
  end
end
