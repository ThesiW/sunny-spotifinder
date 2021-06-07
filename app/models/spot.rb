class Spot < ApplicationRecord
  has_many :reviews
  has_many :favourites
  has_many :bookmarks
  has_many :visits
  has_many_attached :photos
  has_one_attached :picture
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def time_difference
    a = Time.now.to_i
    b = "#{Date.today} #{sun_end}".to_datetime.to_i

    difference_hours = (b - a) / 3600
    difference_minutes = ((b - a) - (difference_hours * 3600) > 1800) ? ",5" : ""
    if difference_hours > 0
      {
        hour: difference_hours,
        minutes: difference_minutes
      }
    else
      "No sun until tomorrow"
    end
  end
end
