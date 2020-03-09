class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:new,  :create, :destroy]

  def index
    @products = policy_scope(Product).order(created_at: :desc)
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(params_product)
    authorize @product
    @product.restaurant = @restaurant
    if @product.save
      redirect_to restaurant_products_path, notice: "Product #{@product.name} added"
    else
      render :new
    end
  end

  def edit
  end

  def update

  end

  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
    redirect_to restaurant_products_path notice: "Bye bye #{@product.name}"
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def params_product
    params.require(:product).permit(:name, :price, :description)
  end
end
