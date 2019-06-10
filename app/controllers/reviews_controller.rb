class ReviewsController < ApplicationController
  def create
    # raise
    @review = current_user.reviews.new(review_params)
    @coffee_shop = CoffeeShop.find(coffee_shop_params[:coffee_shop_id])
    @review.coffee_shop = @coffee_shop
    @review_photo = @review.review_photos.new(review_photo_params[review_photo: [:photo]])
    @review_photo.save!
    @review.save!
    redirect_to coffee_shop_path(@coffee_shop)
#       respond_to do |format|
#         format.js
#       end
#     else
#       render :new
#     end
  end

  private

  # def review_and_review_photo_params
  #   params.require(:review).permit(
  #     review: {
  #       :content,
  #       :rating,
  #       :plug_sockets,
  #       :comfort,
  #       :busyness,
  #       :upload_speed,
  #       :download_speed,
  #       :ping,
  #       review_photo: [{
  #         :photo
  #         }
  #       ]
  #     }
  #   )
  # end

  def review_params
    params.require(:review).permit(
      :content,
      :rating,
      :plug_sockets,
      :comfort,
      :busyness,
      :upload_speed,
      :download_speed,
      :ping
    )
  end

  def review_photo_params
    params.require(:review).permit(review_photo: [:photo])
  end

  def coffee_shop_params
    params.permit(:coffee_shop_id)
  end
end

# class ReviewsController < ApplicationController
#   def create
#     @review = Review.new(review_params)
#     @review.booking_id = booking_params[:booking_id].to_i

#     @booking = Booking.find(booking_params[:booking_id])
#     render :new if @booking.user != current_user
#     if @review.save
#       respond_to do |format|
#         format.js
#       end
#     else
#       render :new
#     end
#   end

#   private

#   def review_params
#     params.require(:review).permit(:content, :item_rating, :lender_rating)
#   end

#   def booking_params
#     params.permit(:booking_id)
#   end
# end
