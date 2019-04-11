Rails.application.routes.draw do
  root "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/home", to: "static_pages#home"
  get "/auth/:provider/callback" => "sessions#create"
  resources :users do
    resources :follows
  end
  resources :likes
  resources :categories do
    resources :books do
      resources :chapters
      resources :comments
    end
  end
end
