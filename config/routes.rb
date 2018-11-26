Rails.application.routes.draw do
  devise_for :users
  get 'residences/index'
  resources :residences
  resources :auctions
  get '/auction/bid_up', to:'auctions#bid_up'
  get '/contacto', to: 'contacts#show'
  get '/terminosycondiciones', to: 'conditions#show'

  root 'residences#index'
end
