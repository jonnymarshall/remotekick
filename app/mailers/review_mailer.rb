class ReviewMailer < ApplicationMailer

  def new_review_posted(user:, review:, venue:)
    assign_vars(user: user, review: review, venue: venue)
    assign_paths(user: user, review: review, venue: venue)

    mail(
      to: user.email,
      subject: "Thank you for posting a review for #{venue.name}.")
  end

  private

  def assign_vars(user:, review:, venue:)
    @user = user
    @review = review
    @venue = venue
  end

  def assign_paths(user:, review:, venue:)
    @root_path = root_url
    # @review_url = url_for [venue, review]
    @venue_url = url_for venue
    @edit_venue_review_url = edit_venue_review_url(venue, review)
  end
end
