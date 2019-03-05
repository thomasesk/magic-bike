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
    @bike = Bike.build(set_params)
    authorize @bike
    if @bike.save
      redirect_to bike_path(@bike)
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
    params.require(:bikes).permit(:name, :type, :price, :start_date, :end_date, :description, :address, :city, :zipcode, :country, :helmet, :locket, :rack, :photo)
  end
end
