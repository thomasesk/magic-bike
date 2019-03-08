class MessagesController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @message = Message.new(review_params)
    @message.booking = @booking
    authorize @message
    if @message.save
      redirect_to booking_path(@booking)
    else
      render 'bookings/show'
    end
  end

  private

  def review_params
    params.require(:message).permit(:content)
  end
end
