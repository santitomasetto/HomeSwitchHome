Rails.application.routes.draw do
  resources :residencias

  root 'residencias#index'
end
