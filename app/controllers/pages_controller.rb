class PagesController < ApplicationController
  layout 'pages' 
  def index
    render 'home/index'
  end
end