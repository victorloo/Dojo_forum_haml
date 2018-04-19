class CategoriesController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @posts = @category.posts.order("#{sort_column} #{sort_direction}").page(params[:page]).per(20)
  end

  private

  def sortable_columns
    ["comments_count", "views_count"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "id"
  end

  def sort_direction
    %w[desc asc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end