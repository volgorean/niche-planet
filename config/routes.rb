Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users do
    resources :posts
  end
  root to: "posts#index"
end
