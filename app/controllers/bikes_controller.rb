class BikesController < ApplicationController
  def index
    @bikes = Bike.all
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude
      }
    end
  end

  def new
    @bike = Bike.new
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def create
    puts params.inspect
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save

      redirect_to bike_path(@bike)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:location, :price_per_day, :condition, :category, photos: [])
  end
end
