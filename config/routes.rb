Rails.application.routes.draw do
  get 'errors/file_not_found'
  get 'errors/unprocessable'
  get 'errors/internal_server_error'

  resources :charges

  resource :checkout, only: [:create, :update]

  resources :job_applications,     only: [:create]
  resources :categories, only: [:show, :index]

  resources :jobs, only: [:show, :index]
  resources :users, except: [:update]

  resources :businesses, only: [:index]

  match '/404', to: 'errors#file_not_found', via: :all
  root to: "home#index"

  namespace :admin do
    # resources :items, except: [:destroy]
    resources :categories
  end

  namespace :user do
    resources :job_applications, only: [:index, :show]
  end

  namespace :businesses, as: :business, path: '/:business' do
    resources :jobs, only: [:index, :edit, :update, :new]
  end
  #
  # namespace :businesses do
  #   resources :administrative_management, only: [:index, :show]
  # end

  get "/business/dashboard", to: "businesses/businesses#dashboard"

  get "/login/twitter", to: "sessions#twitter"
  get '/auth/:provider/callback' => 'sessions#create'

  get "orders/payment", to:         "orders#payment"
  get "admin/job_applications/dashboard", to: "admin/job_applications#dashboard"
  get "admin/job_applications", to:            "admin/job_applications#show"
  post "admin/order/update", to:    "admin/orders#update"

  get "checkout/summary", to:       "checkouts#summary"
  get "checkout/confirmation", to:  "checkouts#confirmation"
  post "checkout/increase", to:     "checkouts#increase"
  post "checkout/decrease", to:     "checkouts#decrease"
  post "checkout/remove", to:       "checkouts#remove"
  get "checkout", to:               "checkouts#show"
  get 'checkout', to:               "checkouts#edit"


  patch "/user", to:                "users#update", as: :update_user
  get "login", to:                  "sessions#new"
  post "login", to:                 "sessions#create"
  delete '/logout', to:             'sessions#destroy'
  get "admin/dashboard", to:        "admin/dashboard#show"
  get "/home", to:                  "home#index"
  get '/about', to:                  "home#about"

  get "/:business/admin_management", to: "businesses/administrative_management#index",   as: :business_administrative_management_index
  get "/:business/admin_management/add", to: "businesses/administrative_management#add", as: :add_business_admin
  post "/:business/admin_management/add", to: "businesses/administrative_management#submit", as: :submit_business_admin

end
