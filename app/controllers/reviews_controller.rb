class ReviewsController < ApplicationController
  before_action :assign_coffee_shop, only: [:show, :create, :new, :edit, :update, :destroy]

  def new
    @review = current_user.reviews.new
    @descriptives = ["wonderful", "fabulous", "superb", "amazing", "stupendous", "phenomenal"]
    @review_photo = ReviewPhoto.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.coffee_shop = @coffee_shop
    unless review_photo_params[:review_photo][:photo] == nil
      @review_photo = @review.review_photos.new(photo: review_photo_params[:review_photo][:photo])
      @review_photo.save!
    end
    @review.save!
    redirect_to coffee_shop_path(@coffee_shop)
  end

  private

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

  def review_photo_params
    params.require(:review).permit(review_photo: [:photo])
  end

  def assign_coffee_shop
    @coffee_shop = CoffeeShop.find(coffee_shop_params[:coffee_shop_id])
  end

  def coffee_shop_params
    params.permit(:coffee_shop_id)
  end
end