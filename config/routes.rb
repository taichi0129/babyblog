Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :likes, only: :index
  resources :babies
  resources :users do
    member do
      get :followings, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end