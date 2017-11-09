Rails.application.routes.draw do
  scope module: :usr do
    root 'items#index'

    resources :items, only: %w[index show]
  end

  scope module: :adm, as: :admin, path: :admin do
    root 'items#index'

    resources :items
    resources :authors
    resources :categories
  end
end
