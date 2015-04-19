class CategoriesController < ApplicationController
  def new
    @category = Category.new

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @category }
    end
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:success] = "Category created!"
      redirect_to root_url
    else
      flash[:danger] = "Oops try again!"
      redirect_to categories_url
    end
  end

  def show
  @categories = Category.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @categories }
    end
  end

private
  def category_params
    params.require(:category).permit(:name, :week)
  end
end
