class Changing < ActiveRecord::Migration[6.0]
  def change
    change_column :spots, :sun_end, :string
    change_column :spots, :sun_start, :string
  end
end
