class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.where(user == current_user)
    @bookmark.user = current_user
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @bookmark.user = current_user
    @bookmark.status = true
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.spot = @spot
    if @bookmark.save
      redirect_to spot_path(@bookmark.spot)
    else
      render 'new'
    end
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.status == true
      @bookmark.status = false
    elsif @bookmark.status == false
      @bookmark.status = true
    end
    if @bookmark.save
      redirect_to spots_path
    else
      render :show
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:spot_id)
  end

end
