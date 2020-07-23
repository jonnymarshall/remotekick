class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  include Pundit
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_current_location, :unless => :devise_controller?
  add_flash_types :success, :error

  # def default_url_options
  #   { host: ENV["DOMAIN"] || "localhost:3000" }
  # end
  
  
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar])
  end

  def store_current_location
    store_location_for(:user, request.url)
  end
end
