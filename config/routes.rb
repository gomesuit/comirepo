require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  scope module: :usr do
    root 'top#index'

    resources :items, only: [:index, :show] do
      member do
        post :count
      end
      collection do
        get :yesterday
        get :today
        get :tomorrow
        get :thisweek
        get :nextweek
        get :free
      end
    end

    resources :items, only: %w[index show]
    resources :authors, only: %w[show]
    resources :series, only: %w[show]
  end

  scope module: :adm, as: :admin, path: :admin do
    if ENV['BASIC_AUTH_USERNAME'].present? && ENV['BASIC_AUTH_PASSWORD'].present?
      Sidekiq::Web.use Rack::Auth::Basic do |name, password|
        name == ENV['BASIC_AUTH_USERNAME'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
    mount Sidekiq::Web, at: '/sidekiq'

    root 'items#index'

    resources :items, only: %w[index edit update destroy] do
      member do
        post :ecs
        post :racy_content
      end
      collection do
        post :regist
      end
    end
    resources :authors, only: %w[index edit update]
    resources :categories, only: %w[index edit update]
    resources :labels, only: %w[index edit update]
    resources :series, only: %w[index edit update]
    resources :footer_ads, only: %w[index new edit update create destroy]
  end

  get '*path', controller: 'usr/base', action: 'render_404'
end
