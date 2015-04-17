class CategoriesController < ApplicationController
  def new
  end

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.paginate(page: params[:page])
  end
end
