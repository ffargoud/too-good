class OrderBasketsController < ApplicationController
  def create
    @order = current_user.orders.last
    @basket_order = OrderBasket.create(order_id: @order.id, basket_id: params[:basket_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @baskets = []
    @restaurant.basket_ids.each do |id|
      @baskets << Basket.find(id)
    end
    redirect_to restaurant_path(params[:restaurant_id])
    authorize @basket_order
  end

  def destroy
    @order_basket = OrderBasket.find(params[:id])
    @order_basket.destroy
    redirect_to restaurant_path(params[:restaurant_id])
    authorize @order_basket
  end

  private

  def params_restaurant
    params.require(:order_basket).permit(:restaurant_id,:basket_id)
  end
end
