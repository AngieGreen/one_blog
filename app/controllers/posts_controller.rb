class PostsController < ApplicationController

  skip_before_action :authorize

  def index
    @posts = Post.all.paginate(:page => params[:page], :per_page => 10)
    @categories = Category.all
  end

  def new
    @category = Category.find(params[:category_id])
    @post = @category.posts.build
    @categories = Category.all
  end

  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.create(post_params)

      if @post.save
        redirect_to posts_path
      else
        redirect_to root_path
      end
  end

  def show
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to posts_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

   private
    def post_params
      params.require(:post).permit(:title, :content, :day)
    end
end