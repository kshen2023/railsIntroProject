class CitiesController < ApplicationController
  def index
    @cities = City.where.not(latitude: nil, longitude: nil).order(:city_name).page(params[:page]).per(10)
    @city_markers = @cities.map { |city| { city_name: city.city_name, latitude: city.latitude, longitude: city.longitude } }
    respond_to do |format|
      format.html
      format.json { render json: @city_markers } # 为了在JavaScript中使用数据
    end
  end

  def show
    @city = City.find(params[:id])
    @country = @city.country
    @races = @city.races
    # Add more associations as needed
  end

def search
    if params[:search].present?
      @search_term = params[:search]
      @cities = City.where("city_name LIKE ?", "%#{@search_term}%")
    else
      @cities = City.none
    end

    render :search_results
  end
  # Add other actions as needed (e.g., show, new, create, edit, update, destroy)
end
