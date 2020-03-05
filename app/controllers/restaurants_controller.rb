class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @restaurant = policy_scope(Restaurant).order(created_at: :asc)
    #   if params[:search]
    #     @restaurants = Restaurant.search_by_name_and_category(params[:search])
    #   else
    # @restaurants = Restaurant.all
      # end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
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
  end

  def update
    @restaurant.update(params_restaurant)
    redirect_to restaurants_path
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def dashboard
      @restaurants = Restaurant.where(user_id: current_user)
      authorize @restaurants
  end

  private
  
  def params_restaurant
    params.require(:restaurant).permit(:name,:description,:address, :category, :price_range, :rating)
  end
end
