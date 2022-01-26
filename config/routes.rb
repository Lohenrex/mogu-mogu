# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :ingredients
  resources :users, only: %i[index edit update destroy]
end
