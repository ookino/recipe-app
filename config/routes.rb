# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    resources :shopping_list, only: [:index, :show]
  end
  resources :foods, only: %i[index new create destroy]
  get 'public_recipes', to: 'recipes#public', as: 'public'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'foods#index'
end
