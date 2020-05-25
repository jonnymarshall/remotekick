class ReviewPolicy < ApplicationPolicy

  def initialize(user, review)
    @user = user
    @review = review
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
end
