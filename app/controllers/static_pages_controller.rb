class StaticPagesController < ApplicationController
  def home
    @food_product = Product.order_created_at_desc.category_by(Settings.category.food).page(params[:food_page]).per Settings.paginate.maximum_page
    @drink_product = Product.order_created_at_desc.category_by(Settings.category.drink).page(params[:drink_page]).per Settings.paginate.maximum_page
    @food_count = Product.category_by(Settings.category.food).count
    @drink_count = Product.category_by(Settings.category.food).count
  end

  def checkout
    current_order
    @order_details = []
    session[:shopping_cart].each do |item|
      @order_details << OrderDetail.new(item)
    end
  end
end
