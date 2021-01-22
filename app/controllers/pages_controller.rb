class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @planets = Planet.all.sort_by { |planet| planet.bookings.size }.take(5)
  end
end
