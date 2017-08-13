class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :destroy]

  def index
    @basket = Basket.new
  end

  def create
    @basket = Basket.new
    @basket.user = current_user

    if @basket.save
      redirect_to @basket
    else
      redirect_to root_path
    end
  end

  def show
    if user_signed_in?
      unless @basket.user == current_user
        flash[:alert] = "You cannot view a basket that is not yours"
        redirect_to root_path
      end
    else
      flash[:alert] = "You must sign in before viewing a basket"
      redirect_to root_path
    end
  end

  def destroy
    if user_signed_in?
      unless @basket.user == current_user
        flash[:alert] = "You cannot delete a basket that is not yours"
        redirect_to root_path
      else
        if @basket.destroy
          flash[:success] = "Basket has been deleted"
          redirect_to baskets_path
        end
      end
    else
      flash[:alert] = "You must sign in before deleting a basket"
      redirect_to root_path
    end
  end

  protected

    def page_not_found
      message = "Basket does not exist"
      flash[:alert] = message
      redirect_to root_path
    end

  private

    def basket_params
      params.require(:basket)
    end

    def set_basket
      @basket = Basket.find(params[:id])
    end

end
