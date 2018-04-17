class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @categories = Category.order(id: :asc)
    
    if params[:id]
      @category = Category.find(params[:id])
    else
      @category = Category.new
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: "Category was successfully created"
    else
      @categories = Category.all
      render "index"
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: "Category was successfully updated"
    else
      @categories = Category.all
      render 'index'
    end
  end
  
  private

  def category_params
    params.require(:category).permit(:name)
  end
end
