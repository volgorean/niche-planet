Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :niches
  resources :users do
    resources :posts do
      resources :itineraries
    end
  end
  resources :itineraries
  root to: "posts#index"
end
