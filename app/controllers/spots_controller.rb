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
      @spot= Spot.all
    end


  end

  def time_difference
    @spot = Spot.find(params[:id])
    a = Time.now.to_i
    b = "#{Date.today} #{@spot.sun_end}".to_datetime.to_i

    @difference_hours = (b - a) / 3600
    @difference_minutes = ((b - a) - (@difference_hours * 3600) > 1800) ? ",5" : ""
    if @difference_hours > 0
      @difference_hours
    else
      "No sun until tomorrow"
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
  time_difference
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
