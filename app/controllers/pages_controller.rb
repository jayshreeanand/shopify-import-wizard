class PagesController < ApplicationController
  layout 'pages'
  skip_before_action :verify_authenticity_token, only: [:cookie_bar]

  def index
    render 'home/index'
  end

  def cookie
    render 'home/cookie'
  end

  def image_tools
    render 'home/image_tools'
  end

  def wizard
    render 'home/wizard'

  end

  def content_tools
    render 'home/content_tools'
  end

  def cookie_bar
    respond_to do |format|
      # format.html # index.html.erb
      # format.xml  { render xml: @users }
      # format.json { render json: @users }
      format.js { render js: @test }
    end
  end
end