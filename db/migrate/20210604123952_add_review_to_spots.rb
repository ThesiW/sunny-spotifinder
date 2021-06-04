class AddReviewToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :review, :string
  end
end
