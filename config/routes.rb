Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'properties/find', to: 'properties#find'

  resources :properties, only: %i(show new create index) do
    resources :reviews, except: %i(index show)
  end

  get 'profile', to: 'pages#profile'
  get 'user_reviews', to: 'pages#user_reviews'


  resources :reviews, only: [:destroy]
end
