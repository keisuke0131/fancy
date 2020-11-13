class SessionsController < ApplicationController
  before_action :before_login , only:[:new,:create]
  before_action :require_login , only:[:destroy]
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase,activated: true)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        flash[:success] = "ログインしました"
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to posts_steps_path
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        redirect_to root_url
      end
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
