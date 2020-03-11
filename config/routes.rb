Rails.application.routes.draw do
  get 'order_baskets/create'
  get 'order_baskets/destroy'
  get 'orders/show'
  get 'orders/new'
  get 'orders/create'
  get 'orders/destroy'
  root to: 'restaurants#index'
  devise_for :users

  resources :restaurants do
    resources :baskets
    resources :products
  end

  get 'dashboard', to: 'restaurants#dashboard', as: 'dashboard'

end
