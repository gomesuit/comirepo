Rails.application.routes.draw do
  root 'sample#index'
  resources :items
  resources :authors
  resources :categories
end
