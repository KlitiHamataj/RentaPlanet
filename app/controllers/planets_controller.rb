class PlanetsController < ApplicationController
  def index
    @planets = Planet.all
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(planets_params)
    if @planet.save
      redirect_to planet_path
    else
      render :new
    end
  end

  private

  def planet_params
    params.require(:planet).permit(:name, :description, :address, :price, :number_guests)
  end
end
