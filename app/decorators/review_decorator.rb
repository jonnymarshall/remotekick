class ReviewDecorator < ApplicationDecorator
  delegate_all
  include IconDisplay
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  
  def when_reviewed
    if ((Time.now - review.updated_at) / 1.day).round == 0
      "Today"
    elsif ((Time.now - review.updated_at) / 1.day).round == 1
      "Yesterday"
    else
      "#{((Time.now - review.updated_at) / 1.day).round} days ago"
    end
  end
end


