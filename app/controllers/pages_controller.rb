class PagesController < ApplicationController
  def home
    # Example logic for home page
    @welcome_message = "Welcome to our application!"
  end
  def about
    # Example logic for about page
    @about_message = "About us - learn more about our application."
  end
  def search
    @search_term = params[:search]
    @scope = params[:scope]

    case @scope
    when 'Countries'
      @results = Country.where("country_name LIKE ?", "%#{@search_term}%")
    when 'Cities'
      @results = City.where("city_name LIKE ?", "%#{@search_term}%")
    when 'Languages'
      @results = Language.where("language_name LIKE ?", "%#{@search_term}%")
    when 'Races'
      @results = Race.where("race_name LIKE ?", "%#{@search_term}%")
    else
      # Search across all models if scope is 'All'
      @results = []
      @results += Country.where("country_name LIKE ?", "%#{@search_term}%") if @scope == 'All' || @scope == 'Countries'
      @results += City.where("city_name LIKE ?", "%#{@search_term}%") if @scope == 'All' || @scope == 'Cities'
      @results += Language.where("language_name LIKE ?", "%#{@search_term}%") if @scope == 'All' || @scope == 'Languages'
      @results += Race.where("race_name LIKE ?", "%#{@search_term}%") if @scope == 'All' || @scope == 'Races'
    end
  end
end
