# frozen_string_literal: true

Rails.application.routes.draw do
  resources :recipes
  devise_for :users
  root "home#index"
  resources :ingredients, except: %i[show]
  resources :ingredient_categories, except: %i[show]
  resources :recipe_categories, except: %i[show]
  resources :appliances, except: %i[show]
  resources :users, except: %i[show new create]
  resources :inventories
end
