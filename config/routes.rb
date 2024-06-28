Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # About page route
  get '/about', to: 'about#about'

  # Defines the root path route ("/")
  root to: 'pages#home'  # Replace 'pages#home' with your actual controller and action for the homepage
#  root 'home#index'
  get 'search', to: 'pages#search'

  # Define other routes as needed
  get 'about', to: 'pages#about'  # Replace 'pages#about' with your actual controller and action for the about page
   resources :cities do
    collection do
      get 'search'
    end
  end
  resources :countries
  resources :cities
  resources :languages
  resources :races

  # Resource routes
  resources :countries, only: [:index]
  resources :cities, only: [:index]
  resources :languages, only: [:index]
  resources :races, only: [:index]



  # Remove any duplicate routes
end
