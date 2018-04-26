class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :comments, :collections, :drafts, :friends]
  before_action :not_allowed, only: [:edit, :collections, :drafts, :friends]

  def show
    @posts = @user.posts.page(params[:page]).per(20)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def comments
    @comments = @user.comments.includes(:post).order("comments.created_at desc").page(params[:page]).per(20)
  end

  def collections
    @collections = @user.collected_posts.order("collections.created_at desc").page(params[:page]).per(20)
  end

  def drafts
    @drafts = @user.posts.where(status: "draft").order("created_at desc").page(params[:page]).per(20)
  end

  def friends
    @target_friends = current_user.waiting_friend
    @applicants = current_user.applicants
    @friends = current_user.all_friends
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def not_allowed
    unless @user == current_user
      redirect_to user_path(@user), alert: "Not allowed!"
    end
  end
  
end
