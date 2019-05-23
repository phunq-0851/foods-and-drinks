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
    total = 0;
    if session[:shopping_cart]
      session[:shopping_cart].each do |item|
        total = total + item["quantity"]*item["price"]
      end
    end
    total
  end
end
