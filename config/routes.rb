Rails.application.routes.draw do
  devise_for :users

  root to: 'baskets#index'

  resources :baskets do
    resources :basket_items
  end
  resources :products
end
