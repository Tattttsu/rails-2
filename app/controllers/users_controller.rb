class UsersController < ApplicationController
  def search
    @user = current_user    
  end
  
  def index
  end

  def account
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "ユーザーを更新しました。"
      redirect_to "/users/account"
    else
      flash.now[:danger] = "更新に失敗しました。"
      render "profile"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :intro, :image)
  end

end
