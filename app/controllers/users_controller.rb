class UsersController < ApplicationController
  
  private

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end
  
end
