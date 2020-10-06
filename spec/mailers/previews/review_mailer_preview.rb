# Preview all emails at http://localhost:3000/rails/mailers/review_mailer
class ReviewMailerPreview < ActionMailer::Preview
  def new_review_posted
    user = FactoryBot.build_stubbed(:user)
    venue = FactoryBot.build_stubbed(:venue)
    review = FactoryBot.build_stubbed(:review)
    ReviewMailer.new_review_posted(user: user, review: review, venue: venue)
  end
end
