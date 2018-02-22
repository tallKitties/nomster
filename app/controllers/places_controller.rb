class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @places = Place.all.paginate(page: params[:page], per_page: 5)
  end

  def new
    @place = Place.new
  end

  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def show
    @place = find_place
  end

  def edit
    @place = find_place
  end

  def update
    @place = find_place
    @place.update_attributes(place_params)
    redirect_to place_path(@place)
  end

  private

  def find_place
    Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end
end
