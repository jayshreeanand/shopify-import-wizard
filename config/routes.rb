Rails.application.routes.draw do
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'

  get 'wizard', to: 'pages#index'
  get 'cookie', to: 'pages#cookie'
  get 'image_tools', to: 'pages#image_tools'
  get 'content_tools', to: 'pages#content_tools'
  get 'cookie_bar', to: 'pages#cookie_bar'
  get 'create_script_tag', to: 'home#create_script_tag' #TODO: use POST
  get 'create_sample_product', to: 'home#create_sample_product'
  post 'import_books', to: 'home#import_books'

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
