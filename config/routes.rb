Rails.application.routes.draw do
  devise_for :dashboards
  # devise_for :users
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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :admins
  # get 'bookings' to: 'display'
   # get 'booking', to: 'bookings#display'
end
