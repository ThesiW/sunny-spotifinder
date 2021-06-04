class SpotsController < ApplicationController

require 'time'

  def index
    @spots = Spot.all
    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude
      }
    end
    if params[:query].present?
      @spot = Spot.where(title: params[:query])
    else
      @spot = Spot.all
    end
  end


  def show
    @spot = Spot.find(params[:id])
    @markers =
      [{
        lat: @spot.geocode[0],
        lng: @spot.geocode[1]
      }]
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
  endmap { |e|  }
  end
end

