Rails.application.routes.draw do
  scope module: :usr do
    root 'items#index'

    get :yesterday, to: 'items#yesterday'
    get :today, to: 'items#today'
    get :tomorrow, to: 'items#tomorrow'
    get :thisweek, to: 'items#thisweek'
    get :nextweek, to: 'items#nextweek'
    get :free, to: 'items#free'

    resources :items, only: %w[index show]
  end

  scope module: :adm, as: :admin, path: :admin do
    root 'items#index'

    resources :items
    resources :authors
    resources :categories
  end
end
