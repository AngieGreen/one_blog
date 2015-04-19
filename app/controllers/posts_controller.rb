class PostsController < ApplicationController


  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      flash[:danger] = "Oops try again!"
      redirect_to posts_url
    end
  end

  def show
  @posts = Post.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @posts }
    end
  end

private
  def post_params
    params.require(:post).permit(:title, :content, :day)
  end
end