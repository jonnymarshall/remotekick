class DevpagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @venue = Venue.first
    render params[:id]
  end
end