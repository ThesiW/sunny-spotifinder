class Bookmark < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  geocoded_by :address
end
