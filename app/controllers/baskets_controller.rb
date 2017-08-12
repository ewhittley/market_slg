class BasketsController < ApplicationController
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

  end
end
