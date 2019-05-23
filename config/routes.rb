Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "static_pages#home"
  get "checkout", to: "static_pages#checkout"
  get "search", to: "search#index"
  resources :products
  resources :carts
  resources :category, only: :show
  resources :suggests
  resources :orders do
    resources :order_details
  end
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
end
