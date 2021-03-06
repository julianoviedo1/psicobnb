Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/ayuda', to: 'pages#help', as: 'ayuda'
  resources :users, only: [:show, :index] do
    resources :appointments, only: [:new, :create]
    resources :reviews, only: [:show, :index]
    resources :profiles, only: [:show, :update]
  end

  resources :appointments, only: [:edit, :update, :index, :show] do
    resources :reviews, only: [:new, :create, :edit, :update]
  end
end
