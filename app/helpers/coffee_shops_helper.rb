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

  def distance_options
    options_for_select([['1 Kilometer', 1], ['3 Kilometers', 3], ['5 Kilometers', 5]], ['10 Kilometers', 10])
  end

  def rating_options
    options_for_select([['*', 0], ['**', 1], ['***', 3], ['****', 4], ['*****', 5]] )
  end
end
