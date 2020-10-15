class UsersController < ApplicationController
  before_action :require_login , only:[:index,:show,:edit,:update,:destroy,:setting] 
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # log_in @user
      # redirect_to posts_path
      @user.send_activation_email
      redirect_to vaild_wait_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    
  end

  def destroy
  end

  def setting
  end

  def vaild_wait
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
end
