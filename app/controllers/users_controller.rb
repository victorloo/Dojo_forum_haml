class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :comments]

  def show
    @posts = @user.posts.page(params[:page]).per(20)
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def comments
    @comments = @user.comments.includes(:post).page(params[:page]).per(20)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end

  def find_user
    @user = User.find(params[:id])
  end
  
end
