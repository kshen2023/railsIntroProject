class CountriesController < ApplicationController
  def index
    @countries = Country.all
  end
  def show
    @country = Country.find(params[:id])
    @cities = @country.cities
    @languages = @country.languages
  end
end
