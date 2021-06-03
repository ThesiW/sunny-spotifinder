class Spot < ApplicationRecord
  has_many :reviews
  has_many :favourites
  has_many :bookmarks
  has_many :visits
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
