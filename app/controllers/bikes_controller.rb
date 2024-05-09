class BikesController < ApplicationController
  def index
    @bikes = Bike.all
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude
      }
    end
    if params[:query].present?
      sql_subquery = <<~SQL
        bikes.location @@ :query
        OR bikes.category @@ :query
      SQL
      @bikes = @bikes.where(sql_subquery, query: params[:query])
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

  # include PgSearch::Model
  # pg_search_scope :search_by_location_and_category,
  #   against: [ :location, :category ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }

  private

  def bike_params
    params.require(:bike).permit(:location, :price_per_day, :condition, :category)
  end
end
