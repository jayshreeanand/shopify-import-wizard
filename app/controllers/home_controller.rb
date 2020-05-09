# frozen_string_literal: true

class HomeController < AuthenticatedController
  layout 'pages' 
  def index
    # @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    @shop = ShopifyAPI::Shop.current.name
  end
end
