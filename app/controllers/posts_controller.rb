class PostsController < ApplicationController
  def new
  end

  def show
    @posts = Post.find(params[:id])
  end

end
