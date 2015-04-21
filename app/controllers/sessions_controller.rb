class SessionsController < ApplicationController

    skip_before_action :authorize, only: [:show, :index, :new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_to new_posts_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end