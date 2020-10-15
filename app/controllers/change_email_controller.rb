class ChangeEmailController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(update_params)
      flash[:success] = "メールアドレスを変更しました"
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  private

    def update_params
      params.permit(:email,:password)
    end
end
