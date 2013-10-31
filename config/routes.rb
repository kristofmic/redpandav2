V2::Application.routes.draw do
  root to: 'feeds#home'

  get 'home', to: 'feeds#home'

  get 'api/feeds', to: 'api_feeds#index'
end
