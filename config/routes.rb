Rails.application.routes.draw do

  # method 'url' => 'controller#action' #description (access rights)

  get '/' => 'main#index' #Landing page (public)

  get '/login' => 'sessions#new' #page to login (public)
  post '/login' => 'sessions#create' #login create action (public)
  delete '/logout' => 'sessions#destroy' #page to logout (public)

  get 'biz_users/' => 'biz_users#index' #show all biz_users (admin)
  get 'biz_users/:id' => 'biz_users#show' #show a particular biz (admin)
  get 'biz_users/new' => 'biz_users#new' #page to add a new biz user (public)
  post 'biz_users/' => 'biz_users#create' #biz user creation action (public)
  get 'biz_users/:id/edit' => 'biz_users#edit' #page to edit biz user (admin, biz_user)
  patch 'biz_users/:id' => 'biz_users#update' #biz user updating action (admin, biz_user)
  delete 'biz_users/:id' => 'biz_users#destroy' #biz user delete action (admin, biz_user)


  get 'stores/' => 'stores#index' #show all stores (admin, biz_user)
  get 'stores/:id' => 'stores#show' #show a particular store (admin, biz_user)
  get 'stores/new' => 'stores#new' #page to add a new store (admin, biz_user)
  post 'stores/' => 'stores#create' #store creation action (admin, biz_user)
  get 'stores/:id/edit' => 'stores#edit' #page to edit store info (admin, biz_user, store)
  patch 'stores/:id' => 'stores#update' #store update action (admin, biz_user, store)
  delete 'stores/:id' => 'stores#destroy' #store delete action (admin, biz_user)


  get 'customers/' => 'customers#index' #show all customers at a store (admin, biz_user, store)
  get 'customers/:id' => 'customers#show' #show a particular customer (admin, biz_user, store_user)
  get 'customers/new' => 'customers#new' #page to add a new customer to a store (public)
  post 'customers/' => 'customers#create' #customer creation action (public)
  get 'customers/:id/edit' => 'customers#edit' #page to change status of customer (admin, biz_user, store)
  patch 'customers/:id' => 'customers#update' #customer update action (admin, biz_user, store)
  delete 'customers/:id' => 'customers#destroy' #customer delete action (admin, biz_user)


  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  # get 'stores/:id' => 'stores#edit' #page to edit store info (admin, biz_user, store)
  # get 'stores/update'
  # get 'stores/destroy'
  #
  # get 'queues/index'
  #
  # get 'queues/show'
  #
  # get 'queues/new'
  #
  # get 'queues/create'
  #
  # get 'queues/edit'
  #
  # get 'queues/update'
  #
  # get 'queues/destroy'
  #
  # get 'users/index'
  #
  # get 'users/show'
  #
  # get 'users/new'
  #
  # get 'users/create'
  #
  # get 'users/edit'
  #
  # get 'users/update'
  #
  # get 'users/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
