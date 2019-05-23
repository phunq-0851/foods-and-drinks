module ApplicationHelper
  def category_names
    Category.get_category
  end

  def total
    session[:shopping_cart].reduce(0) do |total, item|
      total + item["quantity"]*item["price"]
    end
  end

  def current_order
    session[:shopping_cart] ||= []
  end
end
