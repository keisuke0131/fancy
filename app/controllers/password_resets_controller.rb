class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase,activated: true)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      redirect_to reception_url
    else
      flash.now[:danger] = "存在していないメールアドレスです"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?                
      @user.errors.add(:password, :blank)
      render 'edit'
    elsif @user.update(user_params)
      redirect_to success_url
    else
      render 'edit'
    end
  end

  def reception
  end

  def success
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

    def get_user
      @user = User.find_by(email: params[:email])
    end

    def valid_user
      unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
        flash[:danger]="期限切れしています"
        redirect_to password_resets_new_url
      end
    end

    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end