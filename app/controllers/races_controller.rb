class RacesController < ApplicationController
  def index
    @races = Race.all
  end

  # Add other actions as needed
end
