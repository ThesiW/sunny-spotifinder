class BookmarksController < ApplicationController

  def index
    @bookmarks = current_user.bookmarks
    @spots = @bookmarks.map { |bookmark| bookmark.spot }
    # @spots.each do |spot|
    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window: render_to_string(partial: "spots/info_window", locals: { spot: spot }),
        image_url: helpers.asset_url('map-marker-alt-solid.svg')
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


