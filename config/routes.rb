Rails.application.routes.draw do
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'

  get 'test', to: 'pages#index'
  get 'cookie_bar', to: 'pages#cookie_bar'
  get 'create_script_tag', to: 'home#create_script_tag' #TODO: use POST

  namespace :app_proxy do
    root action: 'index'
    # simple routes without a specified controller will go to AppProxyController
    
    # more complex routes will go to controllers in the AppProxy namespace
    # 	resources :reviews
    # GET /app_proxy/reviews will now be routed to
    # AppProxy::ReviewsController#index, for example
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
