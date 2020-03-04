class BasketsController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]

  def index
    # Will match with the restaurant show page
  end

  def show
    @basket = Basket.find(params[:id])
  end

  def new
    @basket = Basket.new
    authorize @basket
  end

  def create
    @basket = Basket.new(params_baskets)
    authorize @basket
    @restaurant.user = current_user

    if @basket.save
      redirect_to baskets_show_path
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
    params.require(:basket).permit(:price, :description, :date, :name, :stock, :restaurant_id)
  end
end
