module CoffeeShopsHelper
  def searched_location(location)
    if location
      location.capitalize
    else
      "Unknown"
    end
  end

  def average_wifi_speed(location)
    if location
      "Value to be calc'd"
    else
      "Unknown"
    end
  end
end
