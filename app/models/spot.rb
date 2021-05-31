class Spot < ApplicationRecord
  has_many :reviews
  has_many :favourites
  has_many :bookmarks
  has_many :visits

end
