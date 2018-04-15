class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  private

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end
  
end
