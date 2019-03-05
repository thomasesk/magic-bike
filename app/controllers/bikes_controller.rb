class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def index
    @bikes = policy_scope(Bike).where(city: params[:city]).where("start_date <= ? AND end_date >= ?", params[:start_date], params[:end_date])
  end

  def show
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
      redirect_to bikes_path
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
    @bike.destroy
    authorize @bike
    redirect_to bikes_path
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :category, :price, :start_date, :end_date, :description, :address, :city, :zipcode, :country, :helmet, :locker, :rack, :photo)
  end
end
