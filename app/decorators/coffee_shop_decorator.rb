class CoffeeShopDecorator < Draper::Decorator
  delegate_all
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #

  def gradient
    "background: linear-gradient(rgba(0,0,0,0.2),rgba(0,0,0,0.6))"
  end

  def hero_image_url
    if object.review_photos.first
      "url('http://res.cloudinary.com/jmarsh5/#{object.review_photos.first[:photo]}') center / cover;"
    else
      "url('https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80') center / cover;"
    end
  end

  def rating_stars(size)
    unless object.rating.nil?
      h.content_tag( :i, nil, :class=>"fas fa-#{size} fas fa-star") * (icon_count_calculator("rating"))
    end
  end
  
  def reviews_info_text
    if has_attribute?("reviews")
      "Based on #{object.reviews.count} reviews."
    else
      "No reviews yet."
    end
  end

  def wifi_speed
    if has_attribute?("upload_speed")
      h.content_tag( :strong, "#{object.download_speed.round(0)} Mbps")
    elsif object.has_wifi || object.has_wifi.nil?
      "Unknown"
    else !object.has_wifi
      "No wifi at venue"
    end
  end

  def display_icons(attribute, icon_set = [])
    if has_attribute?(attribute)
      icon_set << "#{h.content_tag( :i, nil, :class=>'fas fa-smile has-text-primary')}&nbsp;" * (icon_count_calculator(attribute))
      icon_set << h.content_tag( :i, nil, :class=>'far fa-smile') * (inverse_icon_count_calculator(attribute))
      icon_set.join
    else
      "Unknown"
    end
  end

  private

  def has_attribute?(attribute)
    !object.send(attribute).nil?
  end

  def icon_count_calculator(attribute)
    object.send(attribute).round(0) + 1
  end

  def inverse_icon_count_calculator(attribute)
    if attribute == "rating"
      5 - icon_count_calculator(attribute)
    else
      3 - icon_count_calculator(attribute)
    end
  end
end
