Rails.application.routes.draw do
  resources :residencias
  resources :subastas

  root 'residencias#index'
end
