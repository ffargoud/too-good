class BasketsController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]
  skip_after_action :verify_authorized, only:[:index]

  def index
    # Will match with the basket show page
    @baskets = policy_scope(Basket).order(created_at: :asc)
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def show
    @basket = Basket.find(params[:id])
    authorize @basket
  end

  def new
    @basket = Basket.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    authorize @basket
  end

  def create
    @basket = Basket.new(params_baskets)
    @basket.restaurant = Restaurant.find(params[:restaurant_id])
    authorize @basket

    if @basket.save
      redirect_to restaurant_baskets_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @basket = Basket.find(params[:id])
    authorize @basket
    @basket.destroy
    redirect_to restaurant_baskets_path notice: "Bye bye #{@basket.name} basket"
  end

    def update_stock
    @basket = Basket.find(params[:basket_id])
    if params[:stock_update] == "increase"
      @basket.stock += 1
    else
      @basket.stock -= 1
    end
    @basket.save!
    authorize @basket
    redirect_to restaurant_baskets_path(@basket.restaurant)
  end

private

  def params_baskets
     params.require(:basket).permit(:name, :price, :description, :date, :stock, :restaurant_id, :photo, product_ids: [])
   end
end
