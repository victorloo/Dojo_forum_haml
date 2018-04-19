class BaseIndexController < ApplicationController
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