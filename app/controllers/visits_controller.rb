class VisitsController < ApplicationController
  def index
    @visits = current_user.visits
    @spots = @visits.map { |visit| visit.spot }
    # @spots.each do |spot|
    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window: render_to_string(partial: "spots/info_window", locals: { spot: spot }),
        image_url: helpers.asset_url('map-marker-alt-solid.svg')
      }
    end
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @visit = Visit.new
    @visit.user = current_user
    @visit.spot = @spot
    current_user.intake = 0 unless current_user.intake
    if @visit.save!
      current_user.intake += 2500
      current_user.save!
      redirect_to spot_path(@visit.spot)
    else
      render 'new'
    end
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    redirect_to spot_path(@visit.spot)
  end

  private

  def visit_params
    params.require(:visit).permit(:spot_id)
  end
end
