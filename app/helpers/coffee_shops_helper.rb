module CoffeeShopsHelper
  
  def searched_location(location)
    if location
      location.capitalize
    else
      "Search a location"
    end
  end

  def average_wifi_speed(coffee_shops, average_speed = [])
    if coffee_shops
      coffee_shops.each do |coffee_shop|
        puts "coffee shop: #{coffee_shop.name} speed: #{coffee_shop.upload_speed}"
        average_speed << coffee_shop.upload_speed if !coffee_shop.upload_speed.nil?
      end
      puts "average_speed = #{average_speed}"
      puts "average_speed.sum = #{average_speed.sum}"
      puts "average_speed.length = #{average_speed.length}"
      (average_speed.sum / average_speed.length).round(2)
    else
      "Unknown"
    end
  end

  def distance_options
    options_for_select([['1 Kilometer', 1], ['3 Kilometers', 3], ['5 Kilometers', 5]], ['10 Kilometers', 10])
  end

  def rating_options
    options_for_select([['*', 0], ['**', 1], ['***', 3], ['****', 4], ['*****', 5]] )
  end

  def rating_options_with_styles(rating_param)
    icon_element = content_tag( :i, nil, :class=>'fas fa-2x fas fa-star')
    span_element = content_tag( :span, icon_element, :class=>'icon is-medium has-text-light')
    label_tag( rating_param, span_element, :class=>'button is-primary is-outlined is-small')
  end

  def feature_rating_options(feature_param, value)
    smile_icon = smile_type(value)
    icon_element = content_tag( :i, nil, :class=>"fas fa-2x fas fa-#{smile_icon}")
    span_element = content_tag( :span, icon_element, :class=>'icon is-medium has-text-light')
    label_tag( feature_param, span_element, :class=>'button is-primary is-outlined is-small')
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
end
