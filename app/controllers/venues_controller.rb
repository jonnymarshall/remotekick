class VenuesController < ApplicationController
  include Foursquare
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :set_venues, only: [:index]
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  before_action :venues_params, only: [:index]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  # @venue should be called as venue for decorated instance in views
  decorates_assigned :venue
  decorates_assigned :review
  # has_scope :location, if: :location_given?, unless: :distance_given?
  has_scope :rating
  has_scope :upload_speed
  has_scope :no_wifi_restrictions
  has_scope :comfort
  has_scope :quietness
  has_scope :plug_sockets
  has_scope :has_wifi, type: :boolean
  respond_to :html, :json
  
  def index
    # checks if venues exist for location and redirects if not
    venues_in_searched_location = @venues.location(venues_params[:location]) if location_given?
    redirect_to cities_path and return if !venues_in_searched_location.present?

    # Applies scopes
    @venues = apply_scopes(venues_in_searched_location).all
    @venues = @venues.location_with_distance(venues_params[:location], venues_params[:distance].to_i) if location_given? && distance_given?
    # @venues = @venues.near(venues_params[:location], venues_params[:distance]) if location_given? && distance_given?

    order_venues_by_param(@venues, venues_params[:order_by]) if venues_params[:order_by]

    if !request.xhr?
      set_map_markers(@venues) unless params[:order_by] 
      respond_with(@venues)
    end
  end

  def show
    @review = Review.new
    set_map_markers(@venue)
  end

  def new
    # @opening_hours = OpeningHour.new
    # @opening_hours = []
    # 7.times do
    #   @opening_hours << OpeningHour.new
    # end
    # @weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  end

  def create
    @venue = Venue.new(venue_params)
    @address = Address.new(venue_address_params.merge(venue: @venue))
    @venue.users << current_user
    if @venue.save && @address.save
      save_photo_if_photo_uploaded(venue: @venue)
      begin
        VenueMailer.new_venue_listed(user: current_user, venue: @venue).deliver_now!
        flash[:success] = "Thank you, #{@venue.name} was successfully listed."
      rescue StandardError => e
        flash[:alert] = "#{@venue.name} was listed, but there was a problem sending an email confirmation. Please check your email."
      end
      redirect_to venue_path(@venue)
    else
      @venue.errors.messages.merge(@address.errors.messages).each_pair do |key, value|
        flash[:error] = "#{key.capitalize} #{value[0]}."
      end
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
    @venue.address.update(venue_address_params) if params[:venue][:address_attributes].present?
    if @venue.update(venue_params)
      save_photo_if_photo_uploaded(venue: @venue)
      redirect_to venue_path(@venue)
    else
      render :edit
    end
  end

  def destroy
    redirect_to venues_path if @venue.destroy
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

  def set_venues
    @venues = Venue.all
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

  def venue_params
    params.require(:venue).permit(
      :name,
      :description,
      :serves_food,
      :air_conditioning,
      :wifi_restrictions,
      :has_wifi,
      :foursquare_id
    )
  end

  def venue_address_params
    params.require(:venue).require(:address_attributes).permit(
      :address,
      :city,
      :postcode,
      :country,
      :longitude,
      :latitude,
    )
  end

  def new_venue_photo_params
    params[:venue][:photo]
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

  def save_photo_if_photo_uploaded(venue:)
    if new_venue_photo_params
      @photo = Photo.new(imageable: venue)
      @photo.image.attach(new_venue_photo_params[:image])
      @photo.save
    end
  end

  # def opening_hours_params
  #   # params.require([:venue, :opening_hour]).permit(:day, :open, :close)
  #   params.require(:venue).permit(opening_hour: [:day, :open, :close])
  # end

  def venue_search_params
    params.permit(:query, :location)
  end

  def set_map_markers(venues)
    @markers = []
    Array(venues).each do |venue|
      @markers << {
        lat: venue.address.latitude,
        lng: venue.address.longitude,
        infoWindow: render_to_string(partial: "venues/index_partials/index__map_cards", locals: { venue: venue })
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
  
  def authorize_user
    authorize @venue
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
 
    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default

    redirect_to(venue_path(@venue))
  end
end