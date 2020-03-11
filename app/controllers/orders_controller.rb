class OrdersController < ApplicationController
  def new
  end

  def create
    @order = Order.new(params_orders)
    @order.user = current_user
    authorize @order
  end

  def destroy
  end

  private

  def params_orders
    params.require(:order).permit(:users_id, :baskets_id)
  end
end
