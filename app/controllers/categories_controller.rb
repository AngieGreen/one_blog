class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:success] = "Category created!"
      redirect_to root_url
    else
      flash[:danger] = "oops try again"
      redirect_to categories_url
    end
  end

  def show
    @category = Category.find(params[:id])
  end

private
  def category_params
    params.require(:category).permit(:name, :week)
  end
end
