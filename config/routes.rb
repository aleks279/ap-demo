Rails.application.routes.draw do
  devise_for :users
  resources :sections
  resources :pages

  root 'home#index'
end
