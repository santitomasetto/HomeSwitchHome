Rails.application.routes.draw do
  get 'residences/index'
  resources :residences
  resources :auctions

  root 'residences#index'
end
