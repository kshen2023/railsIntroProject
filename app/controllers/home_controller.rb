# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    # Placeholder for index action logic
    # For example, you might fetch some data to display on the homepage
    @countries = Country.all  # Fetch all countries (replace with your actual logic)
    @cities = City.all  # Fetch all cities (replace with your actual logic)
    @languages = Language.all  # Fetch all languages (replace with your actual logic)
    @races = Race.all  # Fetch all races (replace with your actual logic)
  end

  def search
    @search_term = params[:search]
    @category = params[:category]

    case @category
    when 'country'
      @results = Country.where("country_name LIKE ?", "%#{@search_term}%")
    when 'city'
      @results = City.where("city_name LIKE ?", "%#{@search_term}%")
    when 'language'
      @results = Language.where("language_name LIKE ?", "%#{@search_term}%")
    when 'race'
      @results = Race.where("race_name LIKE ?", "%#{@search_term}%")
    else
      @results = []
    end

    render json: @results
  end
end
