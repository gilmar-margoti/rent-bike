class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    @bike = Bike.find(params[:bike_id])
  end

  def new
    @booking = Booking.new
    @bike = Bike.find(params[:bike_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @bike = Bike.find(params[:bike_id])
    @booking.bike = @bike
    if @booking.save
      redirect_to bike_path(@bike)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :bike_id, :user_id)
  end
end
