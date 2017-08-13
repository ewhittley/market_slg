class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show

  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      flash.now[:danger] = "Product has not been created."
      render :new
    end
  end

  private

    def product_params
      params.fetch(:product, {}).permit(:code, :name, :price)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
