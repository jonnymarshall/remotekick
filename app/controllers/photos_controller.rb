class PhotosController < ApplicationController
  before_action :set_venue, only: [:destroy]
  before_action :set_photo, only: [:destroy]
  
  def destroy
    @photo.destroy!
    redirect_to request.referrer if request.referrer
  end

  private

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end