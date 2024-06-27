class RacesController < ApplicationController
  def index
    @races = Race.all
  end
  def show
    @race = Race.find(params[:id])
    @cities = @race.cities
    # Add more associations as needed
  end
  # Add other actions as needed
end
