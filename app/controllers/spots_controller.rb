

class SpotsController < ApplicationController

  def index
    @spots = Spot.all
    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude
      }
    end
  end

  def show

   @spot = Spot.find(params[:id])
   @markers =

      [{
        lat: @spot.geocode[0],
        lng: @spot.geocode[1]
      }]
  end

  def randomise
    @spot ||= Spot.all.shuffle
    @spot.pop
  end
end
