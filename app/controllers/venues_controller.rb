class VenuesController < ApplicationController
  include Foursquare
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  before_action :venues_params, only: [:index]
  before_action :new_venue_params, only: [:create]
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :validate_owner, only: [:edit, :update, :destroy]
  # @venue should be called as venue for decorated instance in views
  decorates_assigned :venue
  has_scope :location, if: :location_given?
  has_scope :rating
  has_scope :upload_speed
  has_scope :no_wifi_restrictions
  has_scope :comfort
  has_scope :quietness
  has_scope :plug_sockets
  has_scope :has_wifi
  # has_scope :air_conditioning, type: :boolean
  respond_to :html, :json

  def index
    @venues = apply_scopes(Venue).all
    if venues_params[:order_by]
      order_venues_by_param(@venues, venues_params[:order_by])
    end
    if location_given? && distance_given?
      @venues = @venues.near(venues_params[:location], venues_params[:distance])
    end

    unless request.xhr?
      set_map_markers(@venues) unless params[:order_by]
    end

    respond_with(@venues)
  end

  def show
    @review = Review.new
    @review_photo = @review.review_photos.new
  end

  def new
    @venue = Venue.new
    # @opening_hours = OpeningHour.new
    # @opening_hours = []
    # 7.times do
    #   @opening_hours << OpeningHour.new
    # end
    # @weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  end

  def create
    @venue = Venue.new(new_venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :new
    end

    # create new opening_hour_set and assign venue
    # @opening_hour_set = OpeningHourSet.new
    # @opening_hour_set.venue = @venue
    # @opening_hour_set.save!

    # save all opening_hours and assign to opening_hour_set
    # unless opening_hours_params.empty?
    #   opening_hours_params[:opening_hour].each do |hours|
    #     new_opening_hours = OpeningHour.new(hours)
    #     new_opening_hours.opening_hour_set = @opening_hour_set
    #     new_opening_hours.save!
    #   end
    # end
  end

  def edit
  end

  def update
    if @venue.update(new_venue_params)
      redirect_to venue_path(@venue)
    else
      render :edit
    end
  end

  def destroy
    @venue.destroy
    redirect_to venues_path
  end

  def venue_search
    location = venue_search_params[:location]
    search = venue_search_params[:query]
    url = api_call(search, location)
    response = open(url).read
    @response_json = JSON.parse(response)
    render json: @response_json
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venues_params
    params.permit(
      :location,
      :rating,
      :upload_speed,
      :comfort,
      :plug_sockets,
      :quietness,
      :has_wifi,
      :order_by,
      :distance,
      :no_wifi_restrictions,
    )
  end

  def new_venue_params
      params.require(:venue).permit(
        :name,
        :description,
        :category,
        :address,
        :serves_food,
        :air_conditioning,
        :wifi_restrictions,
        :has_wifi,
        :longitude,
        :latitude,
        :foursquare_id
      )
  end

  def venues_boolean_params
    params.permit(
      :serves_food,
      :air_conditioning,
      :wifi_restrictions,
      :no_wifi_restrictions,
      :has_wifi
    )
  end

  def opening_hours_params
    # params.require([:venue, :opening_hour]).permit(:day, :open, :close)
    params.require(:venue).permit(opening_hour: [:day, :open, :close])
  end

  def mapbox_api
    baseApiUrl = 'https://api.mapbox.com';
  end

  def venue_search_params
    params.permit(:query, :location)
  end

  def set_map_markers(venues)
    @markers = []
    venues.each do |venue|
      @markers << {
        lat: venue.latitude,
        lng: venue.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { venue: venue })
      }
    end
  end

  def order_venues_by_param(venues, param)
    @venues = @venues.reorder("#{param} DESC NULLS LAST")
  end

  def location_given?
    venues_params[:location] && venues_params[:location] != "" && venues_params[:location] != "Everywhere"
  end

  def query_given?
    venues_params[:location] && venues_params[:location] != ""
  end

  def distance_given?
    venues_params[:distance] && venues_params[:distance].to_i > 0
  end
  
  # def validate_owner
  #   redirect_to venues_path if current_user != @venue.owner
  # end
end
