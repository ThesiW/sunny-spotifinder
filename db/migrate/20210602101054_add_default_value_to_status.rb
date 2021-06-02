class AddDefaultValueToStatus < ActiveRecord::Migration[6.0]
  def change
    change_column_default :bookmarks, :status, true
    change_column_default :favourites, :status, true
  end
end
