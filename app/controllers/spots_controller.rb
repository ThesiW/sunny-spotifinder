

class SpotsController < ApplicationController

  def index
    @spots = Spot.all
  end

  def show
   @spot = Spot.find(params[:id])
   @bookmark = Bookmark.new
   @favourite = Favourite.new
   @visit = Visit.new
  end

  def randomise
    @spot ||= Spot.all.shuffle
    @spot.pop
  end

  private

  def visit_params
    params.require(:visit).permit(:spot_id)
  end

end
