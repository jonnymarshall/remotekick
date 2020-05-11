module VenuesHelper

  def searched_location(location)
    if location && location.length > 0
      location[0] == location[0].upcase ? location : location.capitalize
    else
      "Everywhere"
    end
  end

  def average_wifi_speed(location, wifi_speeds = [])
    if location && location.length > 0
      full_results_for_location(location).each do |venue|
        wifi_speeds << venue.upload_speed if !venue.upload_speed.nil?
      end
      wifi_speeds.empty? ? "No wifi speed data" : "#{calculate_average_wifi_speed(wifi_speeds)} Mbps"
    elsif location.nil? || location == "Everywhere"
      Venue.all.each do |venue|
        wifi_speeds << venue.upload_speed if !venue.upload_speed.nil?
      end
      wifi_speeds.empty? ? "No wifi speed data" : "#{calculate_average_wifi_speed(wifi_speeds)} Mbps"
    else
      "Unknown"
    end
  end

  def total_listings_count(location)
    location && location.length > 0 ? full_results_for_location(location).count(:all) : Venue.all.count(:all)
  end

  def distance_options
    options_for_select([
      ["Distance", 0, { :data => { :target => 'set-selected-option.option', :selected => "#{params[:distance] == "0"}"}}],
      ["1 Kilometer", 1, { :data => { :target => 'set-selected-option.option', :selected => "#{params[:distance] == "1"}"}}],
      ["3 Kilometers", 3, { :data => { :target => 'set-selected-option.option', :selected => "#{params[:distance] == "3"}"}}],
      ["5 Kilometers", 5, { :data => { :target => 'set-selected-option.option', :selected => "#{params[:distance] == "5"}"}}],
      ["10 Kilometers", 10, { :data => { :target => 'set-selected-option.option', :selected => "#{params[:distance] == "10"}"}}],
    ])
  end

  def rating_options(rating_param, value)
    icon_element = content_tag( :i, nil, :class=>'fas fa-2x fas fa-star')
    span_element = content_tag( :span, icon_element, :class=>'icon is-medium has-text-light', :data => { :target => 'icon-state.icon' })
    label = label_tag( "#{rating_param}_#{value}", span_element, :class=>'c-rating-star--label', :data => { :action => 'click->icon-state#selectIcons' })
  end

  def feature_rating_options(feature_param, value)
    smile_icon = smile_type(value)
    icon_element = content_tag( :i, nil, :class=>"fas fa-2x fas fa-#{smile_icon}")
    span_element = content_tag( :span, icon_element, :class=>'icon is-medium has-text-light', :for => "#{feature_param}", :value => "#{value}", :data => { :target => 'icon-state.icon' })
    label_tag( "#{feature_param}_#{value}", span_element, :class=>'c-rating-star--label', :data => { :action => 'click->icon-state#selectIcons'})
  end

  def order_by_options
    options_for_select([
      ["Distance", { :data => { :url => "#{url_for(request.params.merge(:order_by => "distance"))}", :target => 'set-selected-option.option index-cards-ordering.option', :selected => "#{params[:order_by] == "distance"}"}}],
      ["Top rated", { :data => { :url => "#{url_for(request.params.merge(:order_by => "rating"))}", :target => 'set-selected-option.option index-cards-ordering.option', :selected => "#{params[:order_by] == "rating"}"}}],
      ["Wifi Speed", { :data => { :url => "#{url_for(request.params.merge(:order_by => "upload_speed"))}", :target => 'set-selected-option.option index-cards-ordering.option', :selected => "#{params[:order_by] == "upload_speed"}"}}],
      ["Price", { :data => { :url => "#{url_for(request.params.merge(:order_by => "price"))}", :target => 'set-selected-option.option index-cards-ordering.option', :selected => "#{params[:order_by] == "price"}"}}]
    ])
  end

  def highest_upload_speed(venues)
    if venues.length > 0 && at_least_one_value_exists(venues, "upload_speed")
      venues.reorder("upload_speed DESC NULLS LAST").first.upload_speed.ceil
    else
      0
    end
  end

  def lowest_upload_speed(venues)
    if venues.length > 0
      venues.reorder("upload_speed ASC NULLS LAST").first.upload_speed.ceil - 1
    else
      0
    end
  end

  def selected_upload_speed(venues, params_upload_speed)
    if venues.length > 0 && params_upload_speed
      params_upload_speed
    else
      0
    end
  end

  def wifi_restrictions_options
    [['Wifi Restrictions', 0], ['1 Hour', 1], ['2 Hours', 2], ['3 Hours', 3], ['4+ Hours', 4]]
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

  def at_least_one_value_exists(venues, attribute)
    venues.any? {|venue| venue.send(attribute).is_a?(Float)}
  end

  def calculate_average_wifi_speed(wifi_speeds)
    (wifi_speeds.sum / wifi_speeds.length).round(2)
  end

  def full_results_for_location(location)
    Venue.near("#{location}")
  end
end
