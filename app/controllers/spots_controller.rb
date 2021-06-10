require 'csv'
require 'date'
# require 'pycall/import'
# include PyCall::Import

class SpotsController < ApplicationController

require 'time'

  def index
    @spots = Spot.all
    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window: render_to_string(partial: "info_window", locals: { spot: spot }),
        image_url: helpers.asset_url('map-marker-alt-solid.svg')
      }
    end

    if params[:query].present?
      search
      @spot = Spot.where(select2: params[:query])
      # redirect_to spot_visits_path(@spot)
    else
      @spot = Spot.all
    end
  end


  def show
    @spot = Spot.find(params[:id])
    @review = Review.new

    if @spot.geocoded?

    @markers =
      [{
        lat: @spot.latitude,
        lng: @spot.longitude,
        image_url: helpers.asset_url('map-marker-alt-solid.svg')
      }]
    end
    @bookmark = Bookmark.new
    @favourite = Favourite.new
    @visit = Visit.new



#here comes logic related to backend python sun calculations
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

# input/output-file python
    filepath = 'lib/assets/python/user_data.csv'

    # a = Time.now.to_i
    # b = "#{Date.today} 21:59".to_datetime.to_i
    # # b = Time.now.to_i
    # @times = []
    # time = a

    # while time <= b do
    #   @times << (time - a) / 60
    #   time += 1800
    # end
    # @sunny_times = []
    # # CSV.open('lib/assets/python/user_data.csv', 'w') do |csv|
    # # headers = ['user_lat', 'user_long', 'when_days', 'when_hours', 'when_minutes', 'sun_shine']
    # # csv << headers
    #   @times.each do |row|
    #     CSV.open('lib/assets/python/user_data.csv', 'w') do |csv|
    #     csv << [@spot.latitude, @spot.longitude, "0", "0", row, "unknown"]
    #     # csv << [@spot.latitude, @spot.longitude, "0", "0", row, "unknown"]
    #     end
    #     `python lib/assets/python/sun_visibility.py`
    #     CSV.foreach(filepath) do |row|
    #       @sunny_times << row[5]
    #     end
    #   end
    # p @sunny_times
    # end

    # `python lib/assets/python/sun_visibility.py`

# output from python
    # @sunny_times = []
    # CSV.foreach(filepath) do |row|
    #   @sunny_times << row[5]
    # end

    #@sunny_from_index = @sunny_times.index { |s| s == 'True' }
    #@sunny_until_index = @sunny_times.index { |s| s == 'True' }
#converts the position in the array to a datetime
    #@sunny_from_datetime = Time.at((Time.now.to_i + (1800 * @sunny_from_index))) if @sunny_from_index != nil
    #@sunny_until_datetime = Time.at((Time.now.to_i + (1800 * @sunny_until_index))) if @sunny_until_index != nil
    #@spot.sun_start = @sunny_from_datetime.strftime("%H:%M") if @sunny_from_index != nil
    #@spot.sun_end = @sunny_until_datetime.strftime("%H:%M") if @sunny_until_index != nil
    #@spot.save
    #raise
  end



  # def randomise
  #   @spot ||= Spot.all.shuffle
  #   @spot.pop
  # end

    def randomise
     @spot = Spot.order("RANDOM()").first
     redirect_to spot_path(@spot)
   end

  def search
    @spot = Spot.find(params[:query])
    redirect_to spot_path(@spot)
   end



  private

  def visit_params
    params.require(:visit).permit(:spot_id)
  endmap { |e|  }
  end
end
