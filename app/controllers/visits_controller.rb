class VisitsController < ApplicationController

  def index
    @visits = Visit.where(user == current_user)
    @visit.user = current_user
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @visit.user = current_user
    @visit.status = true
    @visit = Visit.new(visit_params)
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
