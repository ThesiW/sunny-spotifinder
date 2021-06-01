

class SpotsController < ApplicationController

  def index
    @spot = Spot.all
  end

  def show
   @spot = Spot.find(params[:id])
  end

  def randomise
    @spot ||= Spot.all.shuffle
    @spot.pop
  end
end
