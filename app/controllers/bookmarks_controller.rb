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

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to spot_path(@bookmark.spot)
  end
end

