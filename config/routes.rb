Rails.application.routes.draw do
  root to: 'restaurants#index'
  devise_for :users

  resources :restaurants do
    resources :baskets do
      resources :order_baskets, only: [:create, :destroy]
    end
    resources :products
  end


  get 'dashboard', to: 'restaurants#dashboard', as: 'dashboard'

end
