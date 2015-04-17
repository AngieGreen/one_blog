class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
  end

 def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      redirect_to posts_url
    end
  end

  def show
    @posts = Post.find(params[:id])
  end

private
  def post_params
    params.require(:post).permit(:title, :content, :day)
  end
end