Rails.application.routes.draw do
  get 'residences/index'
  resources :residences
  resources :auctions
  resources :users
  get '/auction/bid_up', to:'auctions#bid_up'
  get '/contacto', to: 'contacts#show'
  get '/terminosycondiciones', to: 'conditions#show'

  root 'residences#index'
end
