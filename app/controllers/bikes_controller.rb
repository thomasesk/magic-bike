class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def index
    @bikes = policy_scope(Bike).near(params[:city], 10).where("start_date <= ? AND end_date >= ?", params[:start_date], params[:end_date]).where.not(latitude: nil, longitude: nil)
    @search_params = { city: params[:city], start_date: params[:start_date], end_date: params[:end_date] }
    @markers = @bikes.map do |bike|
      {
        lng: bike.longitude,
        lat: bike.latitude,
        infoWindow: render_to_string(partial: "/bikes/map_window", locals: { bike: bike })
      }
    end
  end

  def show
    @booking = Booking.new
    authorize @bike
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    authorize @bike
    if @bike.save
      # redirect_to bike_path(@bike)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    authorize @bike
  end

  def update
    @bike.update(bike_params)
    authorize @bike
    redirect_to bikes_path
  end

  def destroy
    authorize @bike
    @bike.destroy
    redirect_to bikes_path
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :category, :price, :start_date, :end_date, :description, :address, :city, :zipcode, :country, :helmet, :locker, :rack, :photo)
  end
end
