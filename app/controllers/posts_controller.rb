class PostsController < ApplicationController

  skip_before_action :authorize, only: [:show, :index]

  def index
  @posts = Post.all.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @posts }
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @posts }
    end
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

    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html  { redirect_to(@post,
                      :notice => 'Post was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @post.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

   private
    def post_params
      params.require(:post).permit(:title, :content, :day)
    end

end