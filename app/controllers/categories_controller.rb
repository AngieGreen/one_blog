class CategoriesController < ApplicationController
  def new
    @category = current_user.categories.build if logged_in?
  end

  def show
    @category = Category.find(params[:id])
  end
end
