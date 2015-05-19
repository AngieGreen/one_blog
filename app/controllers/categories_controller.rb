class CategoriesController < ApplicationController

  skip_before_action :authorize

  def index
  @categories = Category.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @categories }
    end
  end

  def new
    @category = Category.new
    @categories = Category.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @categories }
    end
  end

  def create
    @category = Category.new(category_params)
    @categories = Category.all

    if @category.save
      redirect_to categories_path
    else
      redirect_to root_path
    end
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html  { redirect_to(@category,
                      :notice => 'Project was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @category.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
    def category_params
      params.require(:category).permit(:name, :week, :minicontent)
    end

end