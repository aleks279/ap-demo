Rails.application.routes.draw do
  resources :sections
  resources :pages

  root 'home#index'
end
