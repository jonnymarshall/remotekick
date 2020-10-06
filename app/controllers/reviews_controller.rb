class ReviewsController < ApplicationController
  before_action :set_venue, only: [:show, :create, :new, :edit, :update, :destroy]
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
    assign_review_and_any_existing_params
    @descriptives = ["wonderful", "fabulous", "superb", "amazing", "stupendous", "phenomenal"]
    @review_photo = Photo.new
  end

  def create
    if form_submitted_from_showpage?
      redirect_to new_venue_review_path(request.parameters)
    else
      @review = @venue.reviews.new(review_params.merge(user: current_user))
      @review.has_wifi = reverse_checkbox_value(review_has_wifi_param[:has_wifi])

      if @review.save
        save_photo_if_photo_uploaded(review: @review)
        # VenueMailer.new_review_listed(user: current_user, review: @venue).deliver_now!
        flash[:success] = "Thank you, your review was successfully posted."
        redirect_to venue_path(@venue)
      else
        @review.errors.messages.each_pair do |key, value|
          flash[:error] = "#{key.capitalize} #{value[0]}."
        end
        render :new
      end
    end
  end

  def edit
    @review_photo = Photo.new
  end

  def update
    if @review.update(review_params)
      save_photo_if_photo_uploaded(review: @review)
      redirect_to venue_path(@venue)
    else
      render :edit
    end
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
      :air_conditioning,
      :has_wifi,
      :photo
    )
  end

  def review_has_wifi_param
    params.require(:review).permit(
      :has_wifi
    )
  end


  def save_photo_if_photo_uploaded(review:)
    if new_review_photo_params
      @photo = Photo.new(imageable: review)
      @photo.image.attach(new_review_photo_params[:image])
      @photo.save
    end
  end

  def new_review_photo_params
    params[:review][:photo]
  end

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def form_submitted_from_showpage?
    params[:review][:from_showpage]
  end

  def assign_review_and_any_existing_params
    if params[:review] && form_submitted_from_showpage?
      @review = current_user.reviews.new(review_params)
    else
      @review = current_user.reviews.new
    end
  end
end