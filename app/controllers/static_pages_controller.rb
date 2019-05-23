class StaticPagesController < ApplicationController
  def home
    @food_product = Product.order_created_at_desc.category_by(Settings.category.food)
      .page(params[:food_page]).per Settings.paginate.maximum_page
    @drink_product = Product.order_created_at_desc.category_by(Settings.category.drink)
      .page(params[:drink_page]).per Settings.paginate.maximum_page
    @food_count = Product.category_by(Settings.category.food).size
    @drink_count = Product.category_by(Settings.category.food).size
  end
end
