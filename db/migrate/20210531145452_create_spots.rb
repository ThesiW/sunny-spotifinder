class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :address
      t.string :rating
      t.string :description
      t.string :link
      t.string :pictures
      t.integer :sun_start
      t.integer :sun_end

      t.timestamps
    end
  end
end
