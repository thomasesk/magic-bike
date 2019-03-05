class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @bike = Bike.find(params[:bike_id])
    @booking.bike = @bike
    @user = current_user
    @booking.user = @user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def destroy
    # @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :pax)
  end

end
