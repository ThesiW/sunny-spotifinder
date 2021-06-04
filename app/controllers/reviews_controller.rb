class ReviewsController < ApplicationController

  def new
    @spot = Spot.find(params[:spot_id])
    @review = Review.new
  end

  # def create
  #   @review = Review.new(review_params)
  #   @spot = Spot.find(params[:spot_id])
  #   @review.spot = @spot
  #   if @review.save
  #     redirect_to spot_path(@spot)
  #   else
  #     render :new
  #   end
  # end

  # private

  # def review_params
  #   params.require(:review).permit(:comment)
  # end
end

