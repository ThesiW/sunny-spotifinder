class ReviewsController < ApplicationController

  def index
  end


  def new
    @spot = Spot.find(params[:spot_id])
    @review = Review.new

  end

 def create
    @spot = Spot.find(params[:spot_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.spot = @spot
    if @review.save
      average_review
      redirect_to spot_path(@spot), notice: 'Your review was successfully added.'
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def average_review
    @spot = Spot.find(params[:spot_id])
      average_review = @spot.reviews.map{|review|review.rating.to_i }.sum / @spot.reviews.count
      @spot.update(rating: average_review)

    end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end


