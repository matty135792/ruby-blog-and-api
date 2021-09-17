Rails.application.routes.draw do
  resources :users
  root "home#index"

  resources :articles do
    resources :comments
  end
end