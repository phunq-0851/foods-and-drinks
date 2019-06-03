Rails.application.routes.draw do
  root "static_pages#home"
  resources :products
  resources :carts
  resources :category, only: :show
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
end
