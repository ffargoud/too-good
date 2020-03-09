class BasketsController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]
  skip_after_action :verify_authorized, only:[:index]

  def index
    # Will match with the restaurant show page
    @basket = policy_scope(Basket).order(created_at: :asc)
end

  def show
    @basket = Basket.find(params[:id])
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

  end

private

  def params_baskets
    params.require(:basket).permit(:name, :price, :description, :date, :stock, :restaurant_id)
  end
end
