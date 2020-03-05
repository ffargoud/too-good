Rails.application.routes.draw do
  root to: 'restaurants#index'
  devise_for :users

  resources :restaurants

  get 'dashboard', to: 'restaurants#dashboard', as: 'dashboard'

end
