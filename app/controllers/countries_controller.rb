class CountriesController < ApplicationController
  def index
    @countries = Country.order(:country_name).page(params[:page])
  end
  def show
    @country = Country.find(params[:id])
    @cities = @country.cities
    @languages = @country.languages
  end
end
