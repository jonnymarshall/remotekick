class VenueDecorator < Draper::Decorator
  delegate_all
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  include IconDisplay

  def gradient
    "background: linear-gradient(rgba(0,0,0,0.2),rgba(0,0,0,0.6))"
  end

  def hero_image_url
    if object.review_photos.last
      "url('http://res.cloudinary.com/jmarsh5/#{object.review_photos.last[:photo]}') center / cover;"
    else
      "url('https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80') center / cover;"
    end
  end

  def rounded_rating(icon_set = [])
    if has_attribute?("rating")
      icon_element = h.content_tag( :i, nil, :class=>'fas fa-star')
      span_element = h.content_tag( :span, icon_element, :class=>"star-icon is-small has-text-primary")
      icon_set << span_element
      icon_set << object.rating.round(2) + 1
      icon_set.join
    else
      "No ratings yet."
    end
  end

  def review_count
    "(#{venue.reviews.count})" if has_any?("reviews")
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
      h.content_tag( :strong, "#{object.upload_speed.round(0)} Mbps")
    elsif object.has_wifi || object.has_wifi.nil?
      "Unknown"
    else !object.has_wifi
      "No wifi at venue"
    end
  end

  def display_icons(attribute, icon_set = [])
    if has_attribute?(attribute)
      icon_set << "#{h.content_tag( :i, nil, :class=>'fas fa-smile has-text-primary')}&nbsp;" * (icon_count_calculator(attribute))
      icon_set << "#{h.content_tag( :i, nil, :class=>'fas fa-smile')}&nbsp;" * (inverse_icon_count_calculator(attribute))
      icon_set.join
    else
      "Unknown"
    end
  end

  
  def category_tag
    if has_attribute?("category")
      tag = h.content_tag( :span, object.category, :class=>'tag is-dark')
      h.content_tag( :div, tag, :class=>'level-item')
    end
  end

  private

  def has_attribute?(attribute)
    !object.send(attribute).nil?
  end

  def has_any?(relation)
    !object.send(relation).empty?
  end
end
