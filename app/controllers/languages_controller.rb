class LanguagesController < ApplicationController
  def index
    @languages = Language.all
  end

  # Add other actions as needed
end
