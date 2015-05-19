Rails.application.routes.draw do
  root to: "home#index"

  get 'errors/file_not_found'

  match '/404', to: 'errors#file_not_found', via: :all

  get 'errors/unprocessable'

  get 'errors/internal_server_error'


  namespace :admin do
    resources :items, except: [:destroy]
    resources :categories
  end

  namespace :user do
    resources :orders, only: [:index, :show]
  end

  get "/login/twitter", to: "sessions#twitter"

  get '/auth/:provider/callback' => 'sessions#create'
  
  resources :charges

  resource :checkout, only: [:create, :update]

  resources :orders, only: [:create]
  resources :categories, only: [:show, :index]

  get "orders/payment", to: "orders#payment"

  get "admin/orders/dashboard", to: "admin/orders#dashboard"

  get "admin/order", to: "admin/orders#show"

  post "admin/order/update", to: "admin/orders#update"

  get "checkout/confirmation", to: "checkouts#confirmation"

  post "checkout/increase", to: "checkouts#increase"

  post "checkout/decrease", to: "checkouts#decrease"

  post "checkout/remove", to: "checkouts#remove"

  get "checkout", to: "checkouts#show"

  get 'checkout', to: "checkouts#edit"

  resources :items, only: [:show, :index]

  resource :user, except: [:update]

  patch "/user", to: "users#update", as: :update_user

  get "login", to: "sessions#new"

  post "login", to: "sessions#create"

  delete '/logout', to: 'sessions#destroy'

  get "admin/dashboard", to: "admin/dashboard#show"

  get "/home", to: "home#index"
end
