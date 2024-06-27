class PagesController < ApplicationController
  def home
    # Example logic for home page
    @welcome_message = "Welcome to our application!"
  end

  def about
    # Example logic for about page
    @about_message = "About us - learn more about our application."
  end
end
