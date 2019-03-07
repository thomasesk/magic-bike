class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]


  def index
    @bookings = policy_scope(Booking)
    @hosted_bookings = Booking.hosted_by(current_user)#.order(start_date: :desc)
  end

  def show
  end

  def new
    # @bike = Bike.find(params[:bike_id])
    # @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bike = Bike.find(params[:bike_id])
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :index
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    authorize @booking
    redirect_to bookings_path
  end

  def destroy
    # @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
    redirect_to bookings_path
  end

  def validate
    # raise
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.status = params[:status]
    @booking.save
    redirect_to bookings_path
    # raise
    # raise
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :pax, :price)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
