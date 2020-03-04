Rails.application.routes.draw do
  root to: 'restaurants#index'
  devise_for :users

  resources :restaurants
end
