class CoffeeShopsController < ApplicationController
  before_action :set_coffee_shop, only: [:edit, :show, :update, :destroy]
  before_action :coffee_shops_params, only: [:index]
  before_action :new_coffee_shop_params, only: [:create]
  before_action :authenticate_user!, except: [:index, :show]
  # @coffee_shop should be called as coffee_shop for decorated instance in views
  decorates_assigned :coffee_shop
  has_scope :location
  has_scope :rating
  has_scope :upload_speed
  has_scope :serves_plant_milk, type: :boolean
  has_scope :serves_food, type: :boolean
  has_scope :serves_smoothies, type: :boolean
  has_scope :air_conditioning, type: :boolean
  has_scope :no_wifi_restrictions
  has_scope :comfort
  has_scope :busyness
  has_scope :plug_sockets
  has_scope :has_wifi

  def index
    @coffee_shops = apply_scopes(CoffeeShop).all
    # raise
    if !coffee_shops_params[:location].nil?
      @coffee_shops = @coffee_shops.near(coffee_shops_params[:location])
    end
    @coffee_shops_params = coffee_shops_params
    @coffee_shops_boolean_params = coffee_shops_boolean_params
    @markers = []

    @coffee_shops.each do |coffee_shop|
      @markers << {
        lat: coffee_shop.latitude,
        lng: coffee_shop.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { coffee_shop: coffee_shop })
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
    unless opening_hours_params.empty?
      opening_hours_params[:opening_hour].each do |hours|
        new_opening_hours = OpeningHour.new(hours)
        new_opening_hours.opening_hour_set = @opening_hour_set
        new_opening_hours.save!
      end
    end
    redirect_to coffee_shop_path(@coffee_shop)
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
  #   @coffee_shop.update(coffee_shop_params)
  # end

  # def destroy
  #   @coffee_shop.destroy
  #   redirect_to coffee_shops_path
  # end

  def venue_search
    search = venue_search_params[:query]
    location = "melbourne"
    url = foursquare_api(location, search)
    response = open(url).read
    @response_json = JSON.parse(response)

    render json: @response_json
  end

  private

  def set_coffee_shop
    @coffee_shop = CoffeeShop.find(params[:id])
  end

  def coffee_shops_params
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

  def coffee_shops_boolean_params
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
