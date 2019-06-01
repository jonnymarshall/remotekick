class CoffeeShopsController < ApplicationController
  before_action :set_coffee_shop, only: [:show, :edit, :update, :destroy]
  before_action :coffee_shop_params, only: [:index]
  has_scope :serves_plant_milk, type: :boolean
  has_scope :serves_food, type: :boolean
  has_scope :serves_smoothies, type: :boolean
  has_scope :air_conditioning, type: :boolean
  # has_scope :wifi_restrictions, type: :integer

  def index
    # if coffee_shop_params.empty?
    #   @coffee_shops = CoffeeShop.all
    # else
    #   @coffee_shops = CoffeeShop.near(params[:address]) if coffee_shop_params[:address]
    #   @coffee_shops = CoffeeShop.where(serves_plant_milk: true) if params[:serves_plant_milk]
    #   @coffee_shops = CoffeeShop.where("wifi_restrictions = 0") if params[:wifi_restrictions]
    # end
    @coffee_shops = apply_scopes(CoffeeShop).all unless coffee_shop_params.empty?
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
    params.permit(:address, :serves_plant_milk, :wifi_restrictions, :serves_food, :serves_smoothies, :air_conditioning)
  end
end
