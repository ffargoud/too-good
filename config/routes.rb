Rails.application.routes.draw do
  root to: 'restaurants#index'
  devise_for :users

  resources :restaurants do
    resources :baskets do
      resources :order_baskets, only: [:create, :destroy]
    end
    resources :products
  end

  resources :orders, only: [:show]

  get 'update_stock', to: 'baskets#update_stock', as: 'update_stock'

  get 'dashboard', to: 'restaurants#dashboard', as: 'dashboard'

end
