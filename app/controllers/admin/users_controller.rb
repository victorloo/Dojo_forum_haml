class Admin::UsersController < Admin::BaseController
  before_action :authenticate_admin
  
  def index
    @users = User.order(id: :asc).page(params[:page]).per(5)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "You changed someone's role"
    else
      @users = User.order(id: :asc).page(params[:page]).per(5)
      render 'index'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:role)
  end
end