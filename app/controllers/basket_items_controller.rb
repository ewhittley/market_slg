class BasketItemsController < ApplicationController
  before_action :set_basket

  def create
    @basket_item = @basket.basket_items.new(basket_item_params)
    redirect_to basket_path(@basket)
  end

  private

    def basket_item_params
      params.require(:basket_item).permit(:product_id, :basket_id)
    end

    def set_basket
      @basket = Basket.find(params[:basket_id])
    end

end
