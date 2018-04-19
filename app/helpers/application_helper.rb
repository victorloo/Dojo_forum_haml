module ApplicationHelper
  def sort_link(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "desc" ? "asc" : "desc"
    icon = sort_direction == "desc" ? "glyphicon glyphicon-chevron-down" : "glyphicon glyphicon-chevron-up"
    icon = column == sort_column ? icon : ""
    link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction}
  end
end
