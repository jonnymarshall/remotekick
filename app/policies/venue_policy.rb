class VenuePolicy < ApplicationPolicy

  def initialize(user, venue)
    @user = user
    @venue = venue
  end

  def edit?
    user_is_authorized?
  end

  def update?
    user_is_authorized?
  end

  def destroy?
    user_is_authorized?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def user_is_authorized?
    venue_has_no_owner_and_user_is_venues_user || venue_has_owner_who_is_the_user
  end

  def venue_has_no_owner_and_user_is_venues_user
    !venue_has_owner? && @venue.user == user
  end

  def venue_has_owner_who_is_the_user
    venue_has_owner? && @venue.owner == user
  end

  def venue_has_owner?
    @venue.owner.present?
  end
  
end
