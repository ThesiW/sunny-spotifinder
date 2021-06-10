class ChangeDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default :spots, :hours, "9:00 - 16:30"
  end
end
