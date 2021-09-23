Rails.application.routes.draw do
  resources :topics
  resources :users
  root "home#index"

  resources :articles do
    resources :comments
  end
end