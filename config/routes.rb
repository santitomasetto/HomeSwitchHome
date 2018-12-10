Rails.application.routes.draw do
  get 'residences/index'
  resources :residences
  resources :auctions
  resources :reservations
  resources :hotsales
  resources :bids
  get '/auction/winner', to:'auctions#winner'
  get '/contacto', to: 'contacts#show'
  get '/terminosycondiciones', to: 'conditions#show'

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        passwords: 'users/passwords',
        registrations: 'users/registrations'
      }
  get '/users/index', to: 'users#index'
  get '/users/make_premium', to: 'users#make_premium'


  root 'residences#index'
end
