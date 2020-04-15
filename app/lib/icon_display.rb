module IconDisplay
  def rating_stars(size)
    unless object.rating.nil?
      h.content_tag( :i, nil, :class=>"fas fa-#{size} fas fa-star") * (icon_count_calculator("rating"))
    end
  end

  private

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