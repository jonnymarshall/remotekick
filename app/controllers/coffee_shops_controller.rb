class CoffeeShopsController < ApplicationController
  before_action :set_coffee_shop, only: [:show, :edit, :update, :destroy]
  before_action :coffee_shop_params, only: [:index]
  before_action :new_coffee_shop_params, only: [:create]
  before_action :authenticate_user!, except: [:index, :show]
  has_scope :address
  has_scope :rating
  has_scope :upload_speed
  has_scope :serves_plant_milk, type: :boolean
  has_scope :serves_food, type: :boolean
  has_scope :serves_smoothies, type: :boolean
  has_scope :air_conditioning, type: :boolean
  # has_scope :wifi_restrictions, type: :integer
  has_scope :no_wifi_restrictions
  has_scope :comfort
  has_scope :busyness
  has_scope :plug_sockets

  def index
    # if coffee_shop_params.empty?
    #   @coffee_shops = CoffeeShop.all
    # else
    #   @coffee_shops = CoffeeShop.near(params[:address]) if coffee_shop_params[:address]
    #   @coffee_shops = CoffeeShop.where(serves_plant_milk: true) if params[:serves_plant_milk]
    #   @coffee_shops = CoffeeShop.where("wifi_restrictions = 0") if params[:wifi_restrictions]
    # end
    @coffee_shops = apply_scopes(CoffeeShop).all
    @coffee_shop_params = coffee_shop_params
    @coffee_shop_boolean_params = coffee_shop_boolean_params

    # @coffee_shop_boolean_params[:wifi_restrictions] = reverse_checkbox_value(coffee_shop_boolean_params[:wifi_restrictions])
    # raise
  end

  def show
    @review = Review.new
    @review_photo = @review.review_photos.new
  end

  def new
    @coffee_shop = CoffeeShop.new
    @opening_hours = OpeningHour.new
    @opening_hours = []
    7.times do
      @opening_hours << OpeningHour.new
    end
  end

  def create
    # create new coffee_shop and assign current user
    @coffee_shop = CoffeeShop.new(new_coffee_shop_params)
    @coffee_shop.user = current_user
    @coffee_shop.save!

    # create new opening_hour_set and assign coffee_shop
    @opening_hour_set = OpeningHourSet.new
    @opening_hour_set.coffee_shop = @coffee_shop
    @opening_hour_set.save!

    # save all opening_hours and assign to opening_hour_set
    opening_hours_params[:opening_hour].each do |hours|
      new_opening_hours = OpeningHour.new(hours)
      new_opening_hours.opening_hour_set = @opening_hour_set
      new_opening_hours.save!
    end
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
    params.permit(:address, :rating, :upload_speed, :comfort, :plug_sockets, :busyness)
  end

  def new_coffee_shop_params
      params.require(:coffee_shop).permit(
        :name,
        :description,
        :address,
        :serves_food,
        :serves_smoothies,
        :air_conditioning,
        :serves_plant_milk,
        :wifi_restrictions,
        :longitude,
        :latitude,
        :foursquare_id
      )
  end

  def coffee_shop_boolean_params
    params.permit(
      :serves_food,
      :serves_smoothies,
      :air_conditioning,
      :serves_plant_milk,
      :wifi_restrictions,
      :no_wifi_restrictions
    )
  end

  def opening_hours_params
    # params.require([:coffee_shop, :opening_hour]).permit(:day, :open, :close)
    params.require(:coffee_shop).permit(opening_hour: [:day, :open, :close])
  end

  # def convert_to_boolean(coffee_shop_boolean_params, boolean_params = [])
  #   # make array of params to iterate
  #   boolean_params << coffee_shop_boolean_params[:serves_food]
  #   boolean_params << coffee_shop_boolean_params[:serves_smoothies]
  #   boolean_params << coffee_shop_boolean_params[:air_conditioning]
  #   boolean_params << coffee_shop_boolean_params[:serves_plant_milk]
  #   # assign boolean value based on integer value
  #   boolean_params.each do |boolean_param|
  #     boolean_param
  #   end
  # end

  def reverse_checkbox_value(value)
    value.to_i.positive? ? 0 : 1
  end
end
