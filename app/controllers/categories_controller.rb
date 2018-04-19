class CategoriesController < BaseIndexController
  helper_method :sort_column, :sort_direction
  
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @posts = @category.posts.order("#{sort_column} #{sort_direction}").page(params[:page]).per(20)
  end

end