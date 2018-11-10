Rails.application.routes.draw do
  get 'subastas/index'
  resources :residencias

  root 'residencias#index'
end
