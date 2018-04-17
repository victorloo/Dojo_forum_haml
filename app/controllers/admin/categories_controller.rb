class Admin::CategoriesController < Admin::BaseController
  before_action :authenticate_admin
  before_action :find_category, only: [:update, :destroy]

  def index
    @categories = Category.order(id: :asc)
    
    if params[:id]
      find_category
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
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: "Category was successfully updated"
    else
      @categories = Category.all
      render 'index'
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, alert: "Category was successfully deleted"
  end
  
  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
  
end
