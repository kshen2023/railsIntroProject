class CitiesController < ApplicationController
  def index
    @cities = City.order(:city_name).page(params[:page]).per(10)
  end
  def show
    @city = City.find(params[:id])
    @country = @city.country
    @races = @city.races
    # Add more associations as needed
  end

  def search
    if params[:search].present?
      @cities = City.where("city_name LIKE ?", "%#{params[:search]}%")
    else
      @cities = City.all
    end

    render :index
  end
  # Add other actions as needed (e.g., show, new, create, edit, update, destroy)
end
