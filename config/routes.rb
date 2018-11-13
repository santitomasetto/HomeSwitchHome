Rails.application.routes.draw do
  get 'residences/index'
  resources :residences
  resources :auctions
  get '/auction/bid_up', to:'auctions#bid_up'

  root 'residences#index'
end
