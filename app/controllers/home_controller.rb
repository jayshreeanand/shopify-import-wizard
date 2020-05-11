# frozen_string_literal: true
# class HomeController < ApplicationController
require './lib/book_fetcher.rb'
require './lib/image_background_remover.rb'

class HomeController < AuthenticationController
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
    @processed_images = params[:processed_images] || nil
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

  def process_images
    query = params['image-urls']
    image_urls = query.split("\n")
    output = {}
    image_urls.each_with_index do |image_url, i|
      # ImageBackgroundRemover.process(image_url, "output_#{i}")
      output[i] = [image_url, "output_#{i}.png"]
    end
    p "-----output is---#{output}"
    redirect_to action: 'image_tools', processed_images: output

  end

  def import_books
    query = params['product-data'] # TODO action params

    books = BookFetcher.book_info(query)

    redirect_to action: :index, products: books

  end
end
