class BookingsController < ApplicationController
  before_action :set_bike, only: %i[index new create show]
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

  def show; end

  def edit; end

  def update
    @booking.update(booking_params)
    redirect_to bike_booking_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :bike_id, :user_id)
  end

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end
end
