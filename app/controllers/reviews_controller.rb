class ReviewsController < ApplicationController
  def create
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
