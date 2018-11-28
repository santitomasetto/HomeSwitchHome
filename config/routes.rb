Rails.application.routes.draw do
  get 'residences/index'
  resources :residences
  resources :auctions
  resources :reservations
  get '/auction/bid_up', to:'auctions#bid_up'
  get '/contacto', to: 'contacts#show'
  get '/terminosycondiciones', to: 'conditions#show'

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        passwords: 'users/passwords',
        registrations: 'users/registrations'
      }
  get '/users/index', to: 'users#index'
  get '/users/make_premium', to: 'users#make_premium'


  root 'residences#index'
end
