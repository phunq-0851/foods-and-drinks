class OrdersController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!, only: %i(create index destroy)
  before_action :load_order, :check_status, only: %i(destroy)

  def index
    @orders = current_user.orders.order_created_at_desc.page(params[:page]).per Settings.paginate.per_page
  end

  def create
    @order = current_user.orders.new orders_params
    session[:shopping_cart].each do |item|
      @order.order_details.new(item)
    end
    mail = params[:email]
    if @order.save
      flash[:success] = t "controllers.users.order_success"
      UserMailer.send_email(mail, current_user, session[:shopping_cart], total).deliver_now
      session[:shopping_cart] = []
    else
      flash[:danger] = t "controllers.users.order_fail"
    end
    redirect_to orders_path
  end

  def destroy
    if @order.destroy
      flash[:success] = t "controllers.users.delete_succ"
    else
      flash[:danger] = t "controllers.users.delete_fail"
    end
    redirect_to orders_path
  end

  private
  def orders_params
    params.permit :total
  end

  def load_order
    @order = current_user.orders.find_by id: params[:id]
    return if @order
    flash[:danger] = t "controllers.users.not-found"
    redirect_to orders_path
  end

  def check_status
    return if @order.pending?
    flash[:danger] = t "controllers.users.cannot_delete"
    redirect_to orders_path
  end

end
