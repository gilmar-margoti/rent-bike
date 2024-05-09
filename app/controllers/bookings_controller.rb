class BookingsController < ApplicationController
  before_action :set_bike
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
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
    set_booking
  end

  def edit
    set_booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to bike_booking_path
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to bike_booking_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :bike_id, :user_id)
  end

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
