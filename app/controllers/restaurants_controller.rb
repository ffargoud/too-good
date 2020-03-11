  class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_after_action :verify_authorized, only:[:it]

  def index
    @restaurants = policy_scope(Restaurant).order(created_at: :asc)

    if params[:query]
      @restaurants = Restaurant.search_by_name_and_category(params[:query])
    else
      @restaurants = Restaurant.all
    end

    # @restaurants = Restaurant.geocoded # returns restaurants with coordinates
    @markers = @restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
      }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant

    @markers = {
        lat: @restaurant.latitude,
        lng: @restaurant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { restaurant: @restaurant })
    }

    @baskets = []
    @restaurant.basket_ids.each do |id|
      @baskets << Basket.find(id)
    end

    @basket_order = OrderBasket.new

    @cart_baskets = current_user.orders.last.order_baskets
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(params_restaurant)
    @restaurant.user = current_user
    authorize @restaurant

    if @restaurant.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    @restaurant.update(params_restaurant)
    redirect_to dashboard_path
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    @restaurant.destroy
    redirect_to dashboard_path
  end

  def dashboard
      @restaurants = Restaurant.where(user_id: current_user)
      authorize @restaurants
  end

  private

  def params_restaurant
    params.require(:restaurant).permit(:name,:description,:address, :category, :price_range, :rating, :photo)
  end
end
