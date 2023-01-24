Rails.application.routes.draw do
  devise_for :dashboards
  # devise_for :users
  get '/bookings/display', to: 'bookings#display'
  root  "homes#index"
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        passwords: 'users/passwords',
        registrations: 'users/registrations'
      }
  resources :trips
  resources :destinations
  resources :restaurants
  # resources :home
  resources :homes
  resources :bookings
  resources :abouts
  # resources :searches
  get '/users/display', to: 'users#display'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :admins
  # get 'bookings' to: 'display'
   # get 'booking', to: 'bookings#display'
  post '/trips/search', to: 'trips#search'
  # post '/searches/search', to: 'searches#search'
  get '/trips/about', to: 'trips#about'
end
