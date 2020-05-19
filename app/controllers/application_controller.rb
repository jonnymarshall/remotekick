class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  include Pundit
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  # def user_not_authorized(exception)
  #   policy_name = exception.policy.class.to_s.underscore
 
  #   flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default

  #   redirect_to(request.referrer || root_path)
  # end
end
