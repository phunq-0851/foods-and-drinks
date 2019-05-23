class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order, :current_cart

  def current_order
    session[:shopping_cart] ||= []
  end

  def current_cart
    return 0 unless session[:shopping_cart]
    session[:shopping_cart].reduce(0) do |total, item|
        total + item["quantity"]
    end
  end
end
