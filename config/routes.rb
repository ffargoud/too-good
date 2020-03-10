Rails.application.routes.draw do
  root to: 'restaurants#index'
  devise_for :users

  resources :restaurants do
    resources :baskets
    resources :products
  end

  get 'update_stock', to: 'baskets#update_stock', as: 'update_stock'

  get 'dashboard', to: 'restaurants#dashboard', as: 'dashboard'

end
