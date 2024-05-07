class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end
  def new
    @bike = Bike.new
  end
  def show
    @bike = Bike.find(params[:id])
  end
  def create
    @bike = Bike.new(bike_params)
  end
  def bike_params
    params.require(:bike).permit(:id, :location, :price_per_day, :condition, :type)
  end
end
