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
    @bike = Bike.find(params[:bike_id])
    @user = @bike.user
    @booking = Booking.new(booking_params)
    @booking.bike = @bike
    @booking.user = @user
    @booking.save
    if @booking.save
      redirect_to bike_bookings_path
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
