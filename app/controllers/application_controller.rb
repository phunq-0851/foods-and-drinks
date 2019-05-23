class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order, :current_cart
  before_action :search_param

  def current_order
    session[:shopping_cart] ||= []
  end

  def current_cart
    total = 0
    if session[:shopping_cart]
      session[:shopping_cart].each do |e|
        total = total + e["quantity"]
      end
    end
    total
  end

  def search_param
    @q = Product.ransack params[:q]
  end
end
