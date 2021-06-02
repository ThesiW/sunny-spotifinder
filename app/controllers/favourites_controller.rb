class FavouritesController < ApplicationController

  def index
    @favourites = current_user.favourites
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @favourite.user = current_user
    @favourite.status = true
    @favourite = Favourite.new(favourite_params)
    @favourite.spot = @spot
    if @favourite.save
      redirect_to spot_path(@favourite.spot)
    else
      render 'new'
    end
  end

  def update
    @favourite = Favourite.find(params[:id])
    if @favourite.status == true
      @favourite.status = false
    elsif @favourite.status == false
      @favourite.status = true
    end
    if @favourite.save
      redirect_to spots_path
    else
      render :show
    end
  end

  private

  def favourite_params
    params.require(:favourite).permit(:spot_id)
  end
end
