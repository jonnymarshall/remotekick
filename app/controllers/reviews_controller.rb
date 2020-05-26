class ReviewsController < ApplicationController
  before_action :set_venue, only: [:show, :create, :new, :edit, :update, :destroy]
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
    @review = current_user.reviews.new
    @descriptives = ["wonderful", "fabulous", "superb", "amazing", "stupendous", "phenomenal"]
    @review_photo = ReviewPhoto.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.has_wifi = reverse_checkbox_value(review_has_wifi_param[:has_wifi])
    @review.venue = @venue
    if review_photo_params[:review_photo].present?
      @review_photo = @review.review_photos.new(photo: review_photo_params[:review_photo][:photo])
      @review_photo.save!
    end
    @review.save!
    redirect_to venue_path(@venue)
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to venue_path(@venue)
  end

  def destroy
    redirect_to venue_path(@venue) if @review.destroy!
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
      :quietness,
      :upload_speed,
      :download_speed,
      :serves_food,
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

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end
end