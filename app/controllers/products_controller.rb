class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params_product)
    authorize @product
    @product.user = current_user
  end

  def edit
  end

  def update
    @
  end

  def destroy
  end
end
