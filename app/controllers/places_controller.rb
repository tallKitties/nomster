class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.all.paginate(page: params[:page], per_page: 5)
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)

    if @place.valid?
      redirect_to place_path(@place)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @place = find_place
    @comment = Comment.new
    @photo = Photo.new
  end

  def edit
    @place = find_place
    if @place.user != current_user
      flash[:error] = "You do not have valid credentials to edit #{@place.name}"
      redirect_to place_path(@place)
    end
  end

  def update
    @place = find_place

    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @place.update_attributes(place_params)
    if @place.valid?
      redirect_to place_path(@place)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place = find_place

    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @place.destroy
    redirect_to root_path
  end

  private

  def find_place
    Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end
end
