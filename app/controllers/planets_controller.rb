class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show]

  def index
    @planets = Planet.all
  end

  def show
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

  def set_planet
    @planet = Planet.find(params[:id])
  end
  
end
