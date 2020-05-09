class PagesController < ApplicationController
  layout 'pages'
  skip_before_action :verify_authenticity_token, only: [:cookie_bar]

  def index
    render 'home/index'
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