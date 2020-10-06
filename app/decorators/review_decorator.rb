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

  def form_heading(venue)
    if object.persisted?
      h.tag.h1 "Edit Review for #{venue.name}", class: "title"
    else
      h.tag.h1 "Add New Review for #{venue.name}", class: "title"
    end
  end

  def form_submit_button(review_form)
    if object.persisted?
      review_form.submit "Update", class: "button is-primary"
    else
      review_form.submit "Submit", class: "button is-primary"
    end
  end

  def form_delete_button(venue)
    if object.persisted?
      h.tag.p class: "control" do
        h.link_to "Delete", h.venue_review_path(venue, object), method: :delete, class: "button is-danger"
      end
    end
  end

end


