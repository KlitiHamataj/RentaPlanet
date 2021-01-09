class BookingsController < ApplicationController
  def new
    @planet = Planet.find(params[:planet_id])
    @booking = Booking.new
  end

  def create
    @planet = Planet.find(params[:planet_id])
    @booking = Booking.new(booking_params)
    @booking.planet = @planet
    if @booking.save
      redirect_to planet_path(@planet)
    else
      render "planets/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :start_date, :end_date)
  end
end
