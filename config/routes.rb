Rails.application.routes.draw do
  resources :resumes, only: [:index, :new, :create, :destroy]
  # get 'resumes/index'

  # get 'resumes/new'

  # get 'resumes/create'

  # get 'resumes/destroy'

  root to: "home#index"

  get 'errors/file_not_found'
  get 'errors/unprocessable'
  get 'errors/internal_server_error'

  # resources :charges
  resources :job_applications,     only: [:create]
  resources :categories, only: [:show, :index]
  resources :jobs, only: [:show, :index]
  resources :users
  resources :businesses, only: [:index]
  resource  :checkout, only: [:create, :update]

  match '/404', to: 'errors#file_not_found', via: :all

  namespace :admin do
    resources :jobs, except: [:destroy]
    resources :categories
    resources :business, only: [:update, :destroy, :index]
  end

  namespace :user do
    resources :job_applications, only: [:index, :show]
  end

  namespace :businesses, as: :business, path: '/:business' do
    resources :jobs, except: [:destroy]
    resources :administrative_management
  end

  # Business Job Applications Routes
  namespace :businesses, as: :business, path: '/:business' do
    resources :job_applications, only: [:index, :show]
  end

  patch "/admin/business/status/:id", to: "admin/business#change_status", as: :admin_business_change_status
  get "/business/dashboard", to:          "businesses/businesses#dashboard"
  get "/business/new", to:                "businesses/businesses#new_account", as: :new_business
  post "/business/submit", to:            "businesses/businesses#create"
  get "/business/confirmation", to:       "businesses/businesses#confirmation", as: :confirm_business_application

  get "/login/twitter", to:         "sessions#twitter"
  get '/auth/:provider/callback' => 'sessions#create'

  # get "orders/payment", to:                   "orders#payment"
  get "admin/job_applications/dashboard", to: "admin/job_applications#dashboard"
  get "admin/job_application", to:            "admin/job_applications#show"
  post "admin/job_application/update", to:    "admin/job_applications#update"

  get "checkout/summary", to:       "checkouts#summary"
  post "checkout/confirmation", to: "checkouts#confirmation"
  get "checkout/resume", to:        "checkouts#resume", as: :checkout_resume
  post "checkout/remove", to:       "checkouts#remove"
  get "checkout", to:               "checkouts#show"
  get 'checkout', to:               "checkouts#edit"


  patch "/users", to:                "users#update", as: :update_user
  get "login", to:                  "sessions#new"
  post "login", to:                 "sessions#create"
  delete '/logout', to:             'sessions#destroy'
  get "admin/dashboard", to:        "admin/dashboard#show"
  get "/home", to:                  "home#index"
  get '/about', to:                  "home#about"

end
