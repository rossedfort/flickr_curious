Rails.application.routes.draw do
  get 'sessions/create'

  root "welcome#index"

  get 'auth/flickr', as: :login
  get 'auth/flickr/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/account', to: "users#edit"

  resources :photos, only: [:index, :show]
  resources :albums, only: [:index, :show]
  resources :users, only: [:update]
end
