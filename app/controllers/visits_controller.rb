class VisitsController < ApplicationController

  def index
    @visits = current_user.visits
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @visit = Visit.new
    @visit.user = current_user
    @visit.spot = @spot
    if @visit.save
      redirect_to spot_path(@visit.spot)
    else
      render 'new'
    end
  end





  private

  def visit_params
    params.require(:visit).permit(:spot_id)
  end

end
