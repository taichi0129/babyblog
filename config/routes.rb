Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  resources :users
end
