class ProductsController < ApplicationController
  before_action :load_product, only: %i(show)

  def show
    @newest_product = Product.new_product
    @relate_product = Product.relate_product @product.category_id
    @top_product = Product.top_product_list
  end

  private
  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "product.show.no-item"
    redirect_to root_path
  end
end
