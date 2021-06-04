class BookmarksController < ApplicationController

  def index
    @bookmarks = current_user.bookmarks
    @markers = @bookmarks.map do |bookmark|
    spot = bookmark.spot
      {
        lat: spot.latitude,
        lng: spot.longitude
      }
    end
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @bookmark = Bookmark.new
    @bookmark.spot = @spot
    @bookmark.user = current_user
    @bookmark.save
    redirect_to spot_path(@bookmark.spot)
  end

  def time_difference(spot)
    a = Time.now.to_i
    b = "#{Date.today} #{spot.sun_end}".to_datetime.to_i

    @difference_hours = (b - a) / 3600
    @difference_minutes = ((b - a) - (@difference_hours * 3600) > 1800) ? ",5" : ""
    if @difference_hours > 0
      return [@difference_hours, @difference_minutes]
    else
      "No sun until tomorrow"
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to spot_path(@bookmark.spot)
  end
end

