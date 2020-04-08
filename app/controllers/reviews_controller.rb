class ReviewsController < ApplicationController
  before_action :assign_venue, only: [:show, :create, :new, :edit, :update, :destroy]

  def new
    @review = current_user.reviews.new
    @descriptives = ["wonderful", "fabulous", "superb", "amazing", "stupendous", "phenomenal"]
    @review_photo = ReviewPhoto.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.has_wifi = reverse_checkbox_value(review_has_wifi_param[:has_wifi])
    @review.venue = @venue
    unless review_photo_params[:review_photo][:photo] == nil
      @review_photo = @review.review_photos.new(photo: review_photo_params[:review_photo][:photo])
      @review_photo.save!
    end
    @review.save!
    redirect_to venue_path(@venue)
  end

  private

  def reverse_checkbox_value(value)
    value.to_i.positive? ? false : true
  end

  def review_params
    params.require(:review).permit(
      :content,
      :rating,
      :plug_sockets,
      :comfort,
      :busyness,
      :upload_speed,
      :download_speed,
      :serves_plant_milk,
      :serves_food,
      :serves_smoothies,
      :air_conditioning
    )
  end

  def review_has_wifi_param
    params.require(:review).permit(
      :has_wifi
    )
  end


  def review_photo_params
    params.require(:review).permit(review_photo: [:photo])
  end

  def assign_venue
    @venue = Venue.find(venue_params[:venue_id])
  end

  def venue_params
    params.permit(:venue_id)
  end
end