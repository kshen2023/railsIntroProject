class CountriesController < ApplicationController
  def index
    @countries = Country.order(:country_name).page(params[:page]).per(10)
  end
  def show
    @country = Country.find(params[:id])
    @cities = @country.cities
    @languages = @country.languages
  end

  def upload_image
    @country = Country.find(params[:id])
    if @country.update(country_params)
      redirect_to @country, notice: 'Image was successfully uploaded.'
    else
      @cities = @country.cities
      @languages = @country.languages
      render :show
    end
  end

  private

  def country_params
    params.require(:country).permit(:image)
  end
end
