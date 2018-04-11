Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'admin/login' => 'users/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :admin do
    resources :pages
  end

  resources :pages, only: [:show]

  root 'home#index'
end
