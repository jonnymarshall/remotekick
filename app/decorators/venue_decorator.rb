class VenueDecorator < Draper::Decorator
  delegate_all
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  include IconDisplay

  def gradient
    "background: linear-gradient(rgba(0,0,0,0.2),rgba(0,0,0,0.6))"
  end

  def hero_image_url(venue_url)
    if venue_url
      "url('#{venue_url}') center / cover;"
    else
      "url('https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80') center / cover;"
    end
  end

  def rounded_rating(icon_set = [])
    if has_attribute?("rating")
      icon_element = h.content_tag( :i, nil, :class=>'fas fa-star')
      span_element = h.content_tag( :span, icon_element, :class=>"star-icon is-small has-text-primary")
      icon_set << span_element
      icon_set << (object.rating + 1).round(1)
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
      h.content_tag( :progress, nil, value: object.send(attribute).round(0) + 1, max: 5, :class=>'progress is-primary')
    else
      "Unknown"
    end
  end

  
  def category_tags
    if has_any?("categories")
      tag = h.content_tag( :span, object.categories.first.name, :class=>'tag is-primary is-small-touch')
      h.content_tag( :div, tag)
    else
      tag = h.content_tag( :span, "Unknown category", :class=>'tag is-primary is-small-touch')
      h.content_tag( :div, tag)
    end
  end

  def form_submit_button(venue_form)
    if object.persisted?
      venue_form.submit "Update", class: "button is-primary"
    else
      venue_form.submit "Submit", class: "button is-primary"
    end
  end

  def form_delete_button
    if object.persisted?
      h.tag.p class: "control" do
        h.link_to "Delete", h.venue_path(object), method: :delete, class: "button is-danger"
      end
    end
  end

  def form_heading
    if object.persisted?
      h.tag.h1 'Edit Venue', class: "title"
    else
      h.tag.h1 'Add New Venue', class: "title"
    end
  end

  def venue_city
    object.address.address if object.try(:address)
  end

  private

  def has_attribute?(attribute)
    !object.send(attribute).nil?
  end

  def has_any?(relation)
    !object.send(relation).empty?
  end
end
