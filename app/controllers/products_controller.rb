class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    unless user_signed_in?
      flash[:alert] = "You must sign in before viewing a product"
      redirect_to root_path
    end
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

  def destroy
    if user_signed_in?
      if @product.destroy
        flash[:success] = "Product has been deleted"
        redirect_to products_path
      end
    else
      flash[:alert] = "You must sign in before deleting a product"
      redirect_to root_path
    end
  end

  protected

    def page_not_found
      message = "Product does not exist"
      flash[:alert] = message
      redirect_to root_path
    end

  private

    def product_params
      params.fetch(:product, {}).permit(:code, :name, :price)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
