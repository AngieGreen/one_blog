class StaticPagesController < ApplicationController

  skip_before_action :authorize

  def home
    @categories = Category.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @categories }
    end
  end

  def rules
    @categories = Category.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @categories }
    end
  end

  def about
    @categories = Category.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @categories }
    end
  end

  def contact
  end

  def goals
    @categories = Category.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @categories }
    end
  end

end