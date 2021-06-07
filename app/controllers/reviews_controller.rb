class ReviewsController < ApplicationController


def index
   @review = Review.all
 end

  def new
    @spot = Spot.find(params[:spot_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @spot = Spot.find(params[:spot_id])
    @review.spot = @spot
    @review.user_id = current_user.id
    if @review.save
      redirect_to spot_path(@spot), notice: 'Your review was successfully added.'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end
