class CitiesController < ApplicationController
  def index
    @cities = City.all
  end
  def show
    @city = City.find(params[:id])
    @country = @city.country
    @races = @city.races
    # Add more associations as needed
  end
  # Add other actions as needed (e.g., show, new, create, edit, update, destroy)
end
