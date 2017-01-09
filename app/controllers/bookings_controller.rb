class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
    @review = Review.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    raise
    redirect_to booking_path(@booking) if @booking.save
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :retreat_id)
  end
end
