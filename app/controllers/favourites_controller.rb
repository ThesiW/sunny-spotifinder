class FavouritesController < ApplicationController

  def index
    @favourites = current_user.favourites
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @favourite = Favourite.new
    @favourite.user = current_user
    @favourite.spot = @spot
    if @favourite.save
      redirect_to spot_path(@favourite.spot)
    else
      render 'new'
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to spot_path(@favourite.spot)
  end
end
