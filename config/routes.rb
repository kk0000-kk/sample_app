# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
  }
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users, only: %i[index show destroy]
  resources :microposts, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
end
