class BookingsController < ApplicationController
  before_action :set_planet, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.planet = @planet
    if @booking.save
      redirect_to planet_path(@planet)
    else
      render "planets/show"
    end
  end

  private

  def set_planet
    @planet = Planet.find(params[:planet_id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :start_date, :end_date)
  end
end
