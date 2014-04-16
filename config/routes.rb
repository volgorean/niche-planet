Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :niches
  resources :users do
    resources :posts
  end
  root to: "posts#index"
end
