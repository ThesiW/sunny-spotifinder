class FavouritesController < ApplicationController

  def index
    @favourites = current_user.favourites.map do |bookmark|
      [bookmark, time_difference(bookmark.spot)]
    end
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

  def time_difference(spot)
    a = Time.now.to_i
    b = "#{Date.today} #{spot.sun_end}".to_datetime.to_i
    @difference_hours = (b - a) / 3600
    @difference_minutes = ((b - a) - (@difference_hours * 3600) > 1800) ? ",5" : ""
    if @difference_hours > 0
      return [@difference_hours, @difference_minutes]
    else
      "No sun until tomorrow"
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to spot_path(@favourite.spot)
  end
end
