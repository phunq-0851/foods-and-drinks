module ApplicationHelper
  def category_names
    Category.get_category
  end
end
