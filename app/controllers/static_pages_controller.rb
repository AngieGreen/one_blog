class StaticPagesController < ApplicationController
  def home
    @categories = Category.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @categories }
    end
  end

  def rules
  end

  def about
  end

  def contact
  end

  def goals
  end

end
