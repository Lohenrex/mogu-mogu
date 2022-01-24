# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :ingredients
  get '/inventory', to: 'inventory#index'
end
