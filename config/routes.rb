Rails.application.routes.draw do
  root 'sample#index'
  resources :items
  resources :authors
  resources :categories

  scope module: :usr do
    root 'top#index'

  end

  scope module: :adm, as: :admin, path: :admin do
    root 'items#index'

    resources :items
    resources :authors
    resources :categories
  end
end
