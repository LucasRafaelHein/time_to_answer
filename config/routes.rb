Rails.application.routes.draw do
  namespace :site do
    get "welcome/index"
  end
  namespace :users_backoffice do
    get "welcome/index"
  end
  namespace :admins_backoffice do
    get "welcome/index" # Dashboard
    resources :admins # Administradores
    resources :subjects # Assuntos/Áreas
    resources :questions # Perguntas
  end
  devise_for :admins
  devise_for :users

  root to: 'site/welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
