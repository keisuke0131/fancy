class ChangePasswordController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
     if @user == @user.authenticate(params[:current_password])
      @user.update(update_params)
      flash[:success] = "パスワードを変更しました"
      redirect_to posts_path
    else
        redirect_to likes_path
    end
  end

  private

    def update_params
      params.permit(:password,:password_confirmation)
    end
end
