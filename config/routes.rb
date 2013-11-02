V2::Application.routes.draw do
  root to: 'main#main'
  get '#/', to: 'users#new'

  get 'feeds/index', to: 'feeds#index'
  get 'api/feeds', to: 'api_feeds#index'

  get 'users/new', to: 'users#new'
  get 'users/profile', to: 'users#show', as: 'profile'
  get 'api/users/show', to: 'api_users#show'
  post 'api/users/create', to: 'api_users#create', as: 'users'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
end
