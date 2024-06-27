Rails.application.routes.draw do
  get 'races/index'
  get 'languages/index'
  get 'cities/index'
  get 'about/about'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/about', to: 'about#about'
  # Defines the root path route ("/")
  # root "posts#index"
  #
  root to: 'pages#home'  # Replace 'pages#home' with your actual controller and action for the homepage
  get 'about', to: 'pages#about'  # Replace 'pages#about' with your actual controller and action for the about page
  # Define other routes as needed
  #
  resources :countries, only: [:index]
  resources :cities, only: [:index]
  resources :languages, only: [:index]
  resources :races, only: [:index]

  resources :countries
end
