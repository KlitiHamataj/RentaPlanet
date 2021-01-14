class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show, :edit]

  def index
    @planets = Planet.all
  end

  def show
  end

  def new
    @planet = Planet.new
  end

  def edit
  end
  
  def create
    @planet = Planet.new(planet_params)
    @planet.user = current_user
    if @planet.save
      redirect_to planet_path(@planet)
    else
      render :new
    end
  end

  private

  def planet_params
    params.require(:planet).permit(:name, :description, :address, :price, :number_guests, photos: [])
  end

  def set_planet
    @planet = Planet.find(params[:id])
  end
  
end
