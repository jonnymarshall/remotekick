class CoffeeShopDecorator < Draper::Decorator
  delegate_all
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #

  def gradient
    "background: linear-gradient(rgba(0,0,0,0.2),rgba(0,0,0,0.8))"
  end

  def hero_image_url
    if object.review_photos.first
      "url('http://res.cloudinary.com/jmarsh5/#{object.review_photos.first[:photo]}') center / cover;"
    else
      "url('https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80') center / cover;"
    end
  end

  def rating_stars(stars_elements = [])
    unless object.rating.nil?
      (object.rating.round(0) + 1).times do
        stars_elements << h.content_tag( :i, nil, :class=>'fas fa-star')
      end
    end
    stars_elements.join
  end
  
  def reviews_info_text
    if has_reviews
      "Based on #{object.reviews.count} reviews."
    else
      "No reviews yet."
    end
  end

  private

  def has_reviews
    !object.reviews.empty?
  end
end
