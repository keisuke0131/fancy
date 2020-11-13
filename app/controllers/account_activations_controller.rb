class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id]) && User.where(email: params[:email],activated: true).empty?
      user.activate
      log_in user
      flash[:success] = "アカウントを有効化しました"
      redirect_to posts_steps_url
    else
      flash[:danger] = "有効化できませんでした"
      redirect_to root_url
    end
  end
  
end