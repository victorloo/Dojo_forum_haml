class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @categories = Category.order(id: :asc).page(params[:page]).per(10)
  end
end
