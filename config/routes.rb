Rails.application.routes.draw do
  resources :residencias
  resources :subastas

  root 'residencias#index'

  get '/subastas/lista', to:'subastas#listaresidencias'
end
