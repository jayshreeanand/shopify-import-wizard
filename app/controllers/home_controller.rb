# frozen_string_literal: true
# class HomeController < ApplicationController
require './lib/book_fetcher.rb'

class HomeController < AuthenticatedController
  layout 'pages' 
  def index
    # @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    # @webhooks = ShopifyAPI::Webhook.find(:all)
    # @shop = ShopifyAPI::Shop.current.name

    @products = params[:products]
  end

  def cookie
  end

  def image_tools
  end

  def content_tools
  end

  def wizard
  end

  def create_script_tag
    ShopifyAPI::ScriptTag.create({ src: "#{ENV["REMOTE_HOST"]}/cookie_bar.js", event: 'onload'})
    redirect_to root_path
  end

  def delete_script_tag
  end

  def create_sample_product
    result = ShopifyAPI::Product.create({ 
      title: "Test product from rails app",
      body_html: "<strong>Good snowboard!</strong>",
      vendor: "Burton",
      product_type: "Snowboard",
      variants: [
        {
          option1: "First",
          price: "10.00",
          sku: "123"
        },
        {
          option1: "Second",
          price: "20.00",
          sku: "123"
        }
      ]
    })

    p result 
    redirect_to root_path
  end


  def import_books
    query = params['product-data'] # TODO action params

    books = BookFetcher.book_info(query)

    redirect_to action: :index, products: books

  end
end
