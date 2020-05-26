class ReviewPolicy < ApplicationPolicy

  def initialize(user, review)
    @user = user
    @review = review
  end

  def new?(venue)
    true unless user_not_logged_in || existing_review_exists_for_user(venue)
  end

  def edit?
    @review.user == @user
  end

  def update?
    @review.user == @user
  end

  def destroy?
    @review.user == @user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def user_not_logged_in
    @user.nil?
  end

  def existing_review_exists_for_user(venue)
    venue.reviews.where(user: @user).any?
  end

end
