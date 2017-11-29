require 'sidekiq/web'
require 'sidekiq-scheduler/web'

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
    if ENV['BASIC_AUTH_USERNAME'].present? && ENV['BASIC_AUTH_PASSWORD'].present?
      Sidekiq::Web.use Rack::Auth::Basic do |name, password|
        name == ENV['BASIC_AUTH_USERNAME'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
    mount Sidekiq::Web, at: '/sidekiq'

    root 'items#index'

    resources :items do
      member do
        post :ecs
      end
    end
    resources :authors
    resources :categories
    resources :labels
  end

  get '*path', controller: 'usr/base', action: 'render_404'
end
