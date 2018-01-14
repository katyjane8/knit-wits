Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/sign-up', as: 'sign-up', to: 'users#new'
  # get '/', to: "items#index"
  root "welcome#index"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  # put '/cart', to: "carts#update"
  # delete '/cart', to: "carts#destroy"
  # get '/cart', to: "carts#show"
  # post '/cart', to: "carts#create"
  resource :cart, only: [:show, :create, :update, :destroy]

  get '/dashboard', to: 'users#show', as: "dashboard"

  get '/users/new', to: "users#new", as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  put '/users/:id', to: 'users#update', as: 'user'
  # resources :users, only: [:new, :create, :edit, :update ]

  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show', as: 'item'
  # resources :items, only: [:index, :show]

  get '/orders', to: 'orders#index'
  post '/orders', to: 'orders#create'
  get '/orders/:id', to: 'orders#show', as: 'order'
  # resources :orders, only: [:index, :show, :create]

  # namespace :admin do
    get '/admin/dashboard', to: "admin/dashboard#index", as: 'admin_dashboard'
    get '/admin/analytics-dashboard', to: "admin/analytics#index", as: 'admin_analytics_dashboard'
    get '/admin/items', to: 'admin/items#index', as: 'admin_items'
    post '/admin/items', to: 'admin/items#create'
    get '/admin/items/new', to: 'admin/items#new', as: 'admin_new_item'
    get '/admin/items/:id/edit', to: 'admin/items#edit', as: 'admin_edit_item'
    get '/admin/items/:id', to: 'admin/items#show', as: 'admin_item'
    put '/admin/items/:id', to: 'admin/items#update'
    delete '/admin/items/:id', to: 'admin/items#destroy'
    # resources :items
    put '/admin/orders', to: 'admin/orders#update', as: 'admin_order'
    # resources :orders, only: [:update]
  # end

  get '/categories', to: 'categories#index', as: 'categories'
  # resources :categories, only: [ :index]
  get "/:category", to: "categories#show", as: "category"
end
