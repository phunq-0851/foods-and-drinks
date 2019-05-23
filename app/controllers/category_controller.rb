class CategoryController < ApplicationController
  before_action :load_cate, only: %i(show)

  def show
    @product_new = Product.category_by(@category).new_product
    @product_top = Product.category_by(@category).top_product_list
  end

  private
  def load_cate
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "category.show.not-found"
    redirect_to root_path
  end
end
