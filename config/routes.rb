Rails.application.routes.draw do
  devise_for :users
  get 'foods/index'
  get 'foods/new'
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/new'
  get 'recipes/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
​
  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: %i[index show new create edit update destroy]
​
  # Defines the root path route ("/")
  root 'foods#index'
end