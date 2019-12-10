class CoffeeShopsController < ApplicationController
  before_action :set_coffee_shop, only: [:show, :edit, :update, :destroy]
  before_action :coffee_shop_params, only: [:index]
  before_action :new_coffee_shop_params, only: [:create]
  before_action :authenticate_user!, except: [:index, :show, :test_page]
  # has_scope :address
  has_scope :location
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
    @coffee_shops = apply_scopes(CoffeeShop).all
    # raise
    @coffee_shops = @coffee_shops.near(coffee_shop_params[:location])
    @coffee_shop_params = coffee_shop_params
    @coffee_shop_boolean_params = coffee_shop_boolean_params
    @markers = []

    @coffee_shops.each do |coffee_shop|
      @markers << {
        lat: coffee_shop.latitude,
        lng: coffee_shop.longitude
      }
    end

    # @coffee_shop_boolean_params[:wifi_restrictions] = reverse_checkbox_value(coffee_shop_boolean_params[:wifi_restrictions])
  end

  def show
    @review = Review.new
    @review_photo = @review.review_photos.new
  end

  def new
    @venue_search_path = venue_search_new_coffee_shop_path
    @coffee_shop = CoffeeShop.new
    @opening_hours = OpeningHour.new
    @opening_hours = []
    7.times do
      @opening_hours << OpeningHour.new
    end
    @weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
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

  def test_page
    @markers = []

    CoffeeShop.all.each do |coffee_shop|
      @markers << {
        lat: coffee_shop.latitude,
        lng: coffee_shop.longitude
      }
    end
  end

  def autocomplete_response
    # redirect_to: autocomplete_data...
    # @@data = File.read("/assets/data/autocomplete_data.json")
    # render :json => @@data
    url = coffee_shops_autocomplete_path
    response = open(url).read
    @response_json = JSON.parse(response)
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
  def venue_search
    # byebug
    search = venue_search_params[:query]
    location = "bali"
    url = foursquare_api(location, search)
    response = open(url).read
    @response_json = JSON.parse(response)

    render json: @response_json
  end

  private

  def set_coffee_shop
    @coffee_shop = CoffeeShop.find(params[:id])
  end

  def coffee_shop_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.permit(:location, :rating, :upload_speed, :comfort, :plug_sockets, :busyness)
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

  def mapbox_api
    baseApiUrl = 'https://api.mapbox.com';
  end

  def foursquare_api(location, search)
    url_root = "https://api.foursquare.com/v2/venues/"
    url_root_search = "#{url_root}search?"
    credentials = "&client_id=#{ENV["FOURSQUARE_CLIENT_ID"]}&client_secret=#{ENV["FOURSQUARE_CLIENT_SECRET"]}"
    versionDate = "&v=20190703"
    limit = "&limit=10"
    food_category_id = "4d4b7105d754a06374d81259"
    bar_category_id = "4bf58dd8d48988d116941735"
    hotel_category_id = "4bf58dd8d48988d1fa931735"
    corporate_coffee_shop_id = "5665c7b9498e7d8a4f2c0f06"
    coworking_space_id = "4bf58dd8d48988d174941735"
    category_ids = "#{food_category_id},#{bar_category_id},#{hotel_category_id},#{corporate_coffee_shop_id},#{coworking_space_id}"
    full_search = "#{url_root_search}near=#{location}&query=#{search}&categoryId=#{category_ids}#{limit}#{credentials}#{versionDate}"
    return full_search
  end

  def venue_search_params
    params.permit(:query)
  end
end
