Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :properties, only: %i(show new create index) do
    resources :reviews, except: %i(index show)
  end

  resources :users, only: [:show]
  get 'profile', to: 'pages#profile'
end
