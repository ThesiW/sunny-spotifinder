class BookmarksController < ApplicationController

  def index
    @bookmarks = current_user.bookmarks
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

