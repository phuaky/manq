Rails.application.routes.draw do

  get '/' => 'main#index' #Landing page

  get 'biz_users/' => 'biz_users#index' #show all biz_users (admin)
  get 'biz_users/show' => 'biz_users#show' #show a particular biz (admin)
  get 'biz_users/new' => 'biz_users/new' #page to add a new biz user (admin, biz_user)
  post 'biz_users/' => 'biz_users#create' #biz user creation action (admin, biz_user)
  get 'biz_users/:id' => 'biz_users#edit' #page to edit biz user (admin, biz_user)
  patch 'biz_users/:id' => 'biz_users#update' #biz user updating action (admin, biz_user)
  delete 'biz_users/:id' => 'biz_users#destroy' #biz user delete action (admin)

  get 'stores/' => 'stores#index' #show all stores (admin, biz_user)
  get 'stores/show' => 'stores#show' #show a particular store (admin, biz_user)
  get 'stores/new' => 'stores#new' #page to add a new store (admin, biz_user)
  post 'stores/' => 'stores#create' #store creation action (admin, biz_user)
  get 'stores/:id' => 'stores#edit' #page to edit store info (admin, biz_user, store)
  get 'stores/update'
  get 'stores/destroy'

  get 'queues/index'

  get 'queues/show'

  get 'queues/new'

  get 'queues/create'

  get 'queues/edit'

  get 'queues/update'

  get 'queues/destroy'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
