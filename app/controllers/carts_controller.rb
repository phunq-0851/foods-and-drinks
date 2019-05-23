class CartsController < ApplicationController
  before_action :current_order, only: %i(index create)
  before_action :load_product, only: %i(destroy update)

  def index
    current_order
    @order_details = []
    session[:shopping_cart].each do |item|
      @order_details << OrderDetail.new(item)
    end
  end

  def create
    current_order
    @product = Product.find_by id: params[:product_id]
    order_detail = OrderDetail.new item_params
    result = find_product_in_cart order_detail.product_id
    if order_detail.quantity < 0 || order_detail.quantity > @product.quantity
      flash[:danger] = "Quantity invalid"
      redirect_to product_path order_detail.product_id
    elsif result
      result["quantity"] = result["quantity"] + order_detail.quantity
    else
      session[:shopping_cart] << order_detail
    end
    flash[:success] = "Add to cart success"
    respond_to do |format|
      format.js
    end
  end

  def destroy
    session[:shopping_cart].each do |item|
      session[:shopping_cart].delete(item) if item["product_id"] == @product.id
    end
    redirect_to carts_path
  end

  def update
    quantity = params[:quantity].to_i
    if quantity < 0 || quantity > @product.quantity
      flash[:danger] = t "controllers.users.invalid_quantity"
    else
      result = find_product_in_cart @product.id
      result["quantity"] = quantity
      if result["quantity"] == 0
        session[:shopping_cart].delete(result)
      end
    end
    redirect_to carts_path
  end

  private
  def find_product_in_cart product_id
    result = nil
    session[:shopping_cart].each do |item|
      next unless item["product_id"] == product_id
      result = item
    end
    result
  end

  def item_params
    params.permit :product_id, :quantity, :price
  end

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "controllers.users.cannot_found"
    redirect_to carts_path
  end
end
