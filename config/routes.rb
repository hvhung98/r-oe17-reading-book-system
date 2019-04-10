Rails.application.routes.draw do
<<<<<<< HEAD
  root "sessions#new"
  post "/login", to: "sessions#create"
  get "/auth/:provider/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/home", to: "static_pages#home"
  resources :users
=======
>>>>>>> cbb8985f37cb571bba4536b814d193f5f6722788
end
