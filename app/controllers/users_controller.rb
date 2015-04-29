class UsersController < ApplicationController

    skip_before_action :authorize

  def new
    @user = User.new
    @categories = Category.all
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to new_category_path, notice: "User was created." }
        format.json { render action: 'show', status: :created, location: @user}
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @users = User.order(:name)
    @categories = Category.all
  end

   private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_digest)
    end

end