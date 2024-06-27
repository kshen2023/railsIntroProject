class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  # Add other actions as needed (e.g., show, new, create, edit, update, destroy)
end
