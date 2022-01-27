# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :ingredients
  resources :ingredient_categories, only: %i[ index new create edit update destroy ]
  resources :users, only: %i[index edit update destroy]
end
