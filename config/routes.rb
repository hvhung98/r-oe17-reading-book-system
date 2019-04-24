Rails.application.routes.draw do
  root "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/home", to: "static_pages#home"
  get "/auth/:provider/callback" => "sessions#create"
  get "/admin", to: "static_pages#index"
  resources :users do
    resources :follows
    resources :histories
  end
  resources :likes
  resources :books
  resources :categories do
    resources :books do
      resources :chapters
      resources :comments
    end
  end
  namespace :admin do
    resources :users
    resources :books
    resources :comments
  end
  resources :notifications
  resources :export_users, only: :index
end
