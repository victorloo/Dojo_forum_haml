class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  
  def index
    @users = User.order(id: :asc).page(params[:page]).per(5)
  end
end