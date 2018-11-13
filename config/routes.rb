Rails.application.routes.draw do
  resources :residencias
  resources :auctions

  root 'residencias#index'
end
