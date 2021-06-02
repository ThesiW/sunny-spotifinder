class Spot < ApplicationRecord
  has_many :reviews
  has_many :favourites
  has_many :bookmarks
  has_many :visits
  has_one_attached :photo
  geocoded_by :address
end
