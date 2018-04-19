class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(20)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end
  
end
