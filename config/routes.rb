# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :appliances, except: %i[show]
  resources :ingredients, except: %i[show]
  resources :users, except: %i[show new create]
end
