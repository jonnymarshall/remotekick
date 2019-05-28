class CoffeeShopsController < ApplicationController
  before_action :set_coffee_shop, only: [:show, :edit, :update, :destroy]
  def index
    @coffee_shops = CoffeeShop.all
  end

  def show
    @coffee_shop = CoffeeShop.find(params[:id])
  end

  def new
    @coffee_shop = CoffeeShop.new
  end

  def create
    @coffee_shop = CoffeeShop.new(coffee_shop_params)
    @coffee_shop.user = current_user
    @coffee_shop.save
    redirect_to coffee_shop_path(@coffee_shop)
  end

  # def edit          # GET /restaurants/:id/edit
  # end

  # def update
  #   @coffee_shop = CoffeeShop.find(params[:id])
  #   @coffee_shop.update(coffee_shop_params)
  # end

  # def destroy
  #   @coffee_shop = CoffeeShop.find(params[:id])
  #   @coffee_shop.destroy
  #   redirect_to coffee_shops_path
  # end

  private

  def set_coffee_shop
    @coffee_shop = CoffeeShop.find(params[:id])
  end

  def coffee_shop_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:coffee_shop).permit(:name, :description)
  end
end
