Rails.application.routes.draw do
  get 'residences/index'
  get 'subastas/index'
  resources :residences

  root 'residences#index'
end
