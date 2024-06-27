class LanguagesController < ApplicationController
  def index
    @languages = Language.all
  end
  def show
    @language = Language.find(params[:id])
    @countries = @language.countries
    # Add more associations as needed
  end
  # Add other actions as needed
end
