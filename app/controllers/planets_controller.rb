class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query] == "my_planets"
      @planets = Planet.where("user_id = ?", current_user)
    elsif  params[:query].present?
      sql_query = "name ILIKE :query OR address ILIKE :query"
      @planets = Planet.where(sql_query, query: "%#{params[:query]}%")
    else
      @planets = Planet.all
    end
    @markers = @planets.geocoded.map do |planet|
      {
        lat: planet.latitude,
        lng: planet.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { planet: planet })
      }
    end
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

  def update
    if @planet.update(planet_params)
      redirect_to planet_path(@planet), notice: 'Planet is updated'
    else
      render :edit
    end
  end

  def destroy
    @planet.destroy
    redirect_to planets_path, notice: 'Your planet has been deleted successfully.'
  end

  private

  def planet_params
    params.require(:planet).permit(:name, :description, :address, :price, :number_guests, photos: [])
  end

  def set_planet
    @planet = Planet.find(params[:id])
  end
end
