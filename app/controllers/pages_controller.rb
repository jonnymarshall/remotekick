class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  respond_to :html, :json

  # layout false, only: [:home]
  def home
    @current_page = "/"
    algolia_response = AlgoliaPlaces.new(location_search_params[:query]).run_query
    respond_with(algolia_response)
  end

  private

  def location_search_params
    params.permit(:query)
  end
end
