Rails.application.routes.draw do
  devise_for :dashboards
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
  resources :homes
  resources :bookings
  resources :abouts
  resources :admins
  resources :user_bookings
  get '/users/display', to: 'users#display'

  post '/trips/search', to: 'trips#search'
  get '/trips/about', to: 'trips#about'
end
