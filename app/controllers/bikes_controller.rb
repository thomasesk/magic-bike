class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.build(set_params)
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_params
    params.require(:bikes).permit(:name, :type, :price, :start_date, :end_date, :description, :address, :city, :zipcode, :country, :helmet, :locket, :rack, :photo)
  end
end
