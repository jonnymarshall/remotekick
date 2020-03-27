module CoffeeShopsHelper

  def searched_location(location)
    if location && location.length > 0
      location.capitalize
    else
      "Everywhere"
    end
  end

  def average_wifi_speed(location, wifi_speeds = [])
    if location && location.length > 0
      full_results_for_location(location).each do |coffee_shop|
        wifi_speeds << coffee_shop.upload_speed if !coffee_shop.upload_speed.nil?
      end
      wifi_speeds.empty? ? "No wifi speed data" : "#{calculate_average_wifi_speed(wifi_speeds)} Mbps"
    else
      "Unknown"
    end
  end

  def total_listings_count(location)
    location && location.length > 0 ? full_results_for_location(location).count(:all) : CoffeeShop.all.count(:all)
  end

  def distance_options
    options_for_select([['1 Kilometer', 1], ['3 Kilometers', 3], ['5 Kilometers', 5]], ['10 Kilometers', 10])
  end

  def rating_options(rating_param, value)
    icon_element = content_tag( :i, nil, :class=>'fas fa-2x fas fa-star')
    span_element = content_tag( :span, icon_element, :class=>'icon is-medium has-text-light', :data => { :target => 'index-filter-icons.icon' })
    label = label_tag( "#{rating_param}_#{value}", span_element, :class=>'c-rating-star--label', :data => { :action => 'click->index-filter-icons#selecticons' })
  end

  def feature_rating_options(feature_param, value)
    smile_icon = smile_type(value)
    icon_element = content_tag( :i, nil, :class=>"fas fa-2x fas fa-#{smile_icon}")
    span_element = content_tag( :span, icon_element, :class=>'icon is-medium has-text-light', :for => "#{feature_param}", :value => "#{value}", :data => { :target => 'index-filter-icons.icon' })
    label_tag( "#{feature_param}_#{value}", span_element, :class=>'c-rating-star--label', :data => { :action => 'click->index-filter-icons#selecticons'})
  end

 def highest_upload_speed(coffee_shops)
  coffee_shops.reorder("upload_speed DESC NULLS LAST").first.upload_speed.ceil
 end

  private

  def smile_type(value)
    case value
    when 0
      "frown"
    when 1
      "meh"
    when 2
      "smile"
    end
  end

  def calculate_average_wifi_speed(wifi_speeds)
    (wifi_speeds.sum / wifi_speeds.length).round(2)
  end

  def full_results_for_location(location)
    CoffeeShop.near("#{location}")
  end
end
