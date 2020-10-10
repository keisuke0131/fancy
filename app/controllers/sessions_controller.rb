class SessionsController < ApplicationController
  before_action :before_login , only:[:new,:create]
  before_action :require_login , only:[:destroy]
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
