require 'csv'
require 'date'

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
    @markers =
      [{
        lat: @spot.geocode[0],
        lng: @spot.geocode[1]
      }]
    @bookmark = Bookmark.new
    @favourite = Favourite.new
    @visit = Visit.new

    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

# input to python
    filepath = 'app/controllers/file.csv'
    a = Time.now.to_i
    b = "#{Date.today} 23:59".to_datetime.to_i

    @times = []
    time = a

    while time < b do
      @times << (time - a) / 60
      time += 1800
    end

    CSV.open('app/controllers/input.csv', 'w') do |csv|
      @times.each do |row|
        csv << [@spot.latitude, @spot.longitude, row]
      end
    end

# output from python
    filepath = 'app/controllers/output.csv'
    @sunny_times = []
    CSV.foreach(filepath) do |row|
      @sunny_times << row[3]
    end

    # @sunny_now = false

    # if @sunny_times[0] == 'true'
    #   @sunny_now = true
    # else
    #   @sunny_now = false
    # end

    #sunny_from will say from now if it is sunny now
    @sunny_from_index = @sunny_times.index{ |s| s == 'true' }
    @sunny_until_index = @sunny_times.rindex { |s| s == 'true' }
    #converts the position in the array to a datetime
    @sunny_from_datetime = Time.at((Time.now.to_i + (1800 * @sunny_from_index)))
    @sunny_until_datetime = Time.at((Time.now.to_i + (1800 * @sunny_until_index)))

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

